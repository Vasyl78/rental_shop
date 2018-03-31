# == Schema Information
#
# Table name: users
#
#  id      :integer          not null, primary key
#  name    :string
#  email   :string
#  city_id :integer
#

class User < ApplicationRecord
  has_many   :items
  has_many   :items_reviews, through: :items, class_name: 'Review'
  has_many   :reviews
  has_many   :bookings
  has_many   :comments, as: :object, class_name: 'Review'
  belongs_to :city

  validates_associated :city

end
