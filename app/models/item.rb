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
  scope :in_city,       ->(title) { where(city: City.find_by(title: title)) }
  scope :from_category, ->(name)  { joins(:category).where('categories.name LIKE (?)', "%#{name}%") }
  scope :with_name,     ->(name)  { where('name LIKE (?)', "%#{name}%") }
  scope :with_brand,    ->(value) { where('brand = ?', value) }
  scope :with_size,     ->(range) { where('range IN (?)', range) }

  # Callbacks
  before_validation :set_city

  private

  def set_city
    self.city = user.city
  end
end
