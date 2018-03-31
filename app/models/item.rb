# == Schema Information
#
# Table name: items
#
#  id      :integer          not null, primary key
#  name    :string
#  user_id :integer
#  city_id :integer
#

class Item < ApplicationRecord
  # Relations
  belongs_to :user
  belongs_to :city
  has_many   :bookings
  has_many   :items_reviews, as: :object, class_name: 'Review'

  # Validations
  validates :name, presence: true

  # Scoupes
  scope :in_city, ->(title) { where(city: City.find_by(title: title)) }

  # Callbacks
  before_validation :set_city

  private

  def set_city
    self.city = user.city
  end
end
