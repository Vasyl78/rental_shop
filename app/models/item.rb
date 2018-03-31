# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  name        :string
#  user_id     :integer
#  city_id     :integer
#  category_id :integer
#  brand       :string
#  size        :integer
#

class Item < ApplicationRecord
  include Filterable
  # Relations
  belongs_to :user
  belongs_to :city
  belongs_to :category
  has_many   :bookings
  has_many   :items_reviews, as: :object, class_name: 'Review'

  # Validations
  validates :name, presence: true

  # Scoupes
  scope :item_city,     ->(title) { joins(:city).where('cities.title = ?', title) }
  scope :item_category, ->(name)  { joins(:category).where('categories.name LIKE (?)', "%#{name}%") }
  scope :item_name,     ->(name)  { where('name LIKE (?)', "%#{name}%") }
  scope :item_brand,    ->(value) { where('brand = ?', value) }

  scope :with_size,        ->(range) { where('size IN (?)', range) }
  scope :with_daily_price, ->(range) { where('daily_price IN (?)', range) }
  scope :item_non_booked,  ->(range) { joins(:bookings).where.not('(bookings.start_date IN (?)) OR (bookings.end_date IN (?))', range, range)}
  scope :with_daily_price_and_days, ->(range, days) { with_daily_price(price_range_for_day(range, days))}

  # Callbacks
  before_validation :set_city

  def self.size_range(string)
    array = string.split('..').map(&:to_i)
    range = array[0]..array[1]
    with_size(range)
  end

  def self.non_booked(params)
    array = params.map(&:to_date)
    range = array[0]..array[1]
    item_non_booked(range)
  end

  def self.price_range_and_day(params)
    days = params['days'].to_i
    range = params['min_price'].to_i..params['max_price'].to_i
    with_daily_price_and_days(range, days)
  end

  private

  def set_city
    self.city = user.city
  end

  def self.price_range_for_day(range, days)
    (range.first / days)..(range.last / days)
  end  
end
