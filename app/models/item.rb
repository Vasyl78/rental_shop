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
  # Relations
  belongs_to :user
  belongs_to :city
  belongs_to :category
  has_many   :bookings
  has_many   :items_reviews, as: :object, class_name: 'Review'

  # Validations
  validates :name, presence: true

  # Scoupes
  scope :in_city,          ->(title) { joins(:city).where('cities.title = ?', title) }
  scope :from_category,    ->(name)  { joins(:category).where('categories.name LIKE (?)', "%#{name}%") }
  scope :with_name,        ->(name)  { where('name LIKE (?)', "%#{name}%") }
  scope :with_brand,       ->(value) { where('brand = ?', value) }
  scope :with_size,        ->(range) { where('range IN (?)', range) }
  scope :with_daily_price, ->(range) { where('daily_price IN (?)', range) }
  scope :non_booked,       ->(range) { joins(:bookings).where.not('(bookings.start_date IN (?)) OR (bookings.end_date IN (?))', range, range)}
  scope :with_daily_price_and_days, ->(range, days) { with_daily_price(price_range_for_day(range, days))}

  # Callbacks
  before_validation :set_city

  private

  def set_city
    self.city = user.city
  end

  def self.price_range_for_day(range, days)
    (range.first / days)..(range.last / days)
  end
end
