# == Schema Information
#
# Table name: users
#
#  id    :integer          not null, primary key
#  name  :string
#  email :string
#

class User < ApplicationRecord
  has_many :items
  has_many :reviews
  has_many :bookings
  has_many :comments, as: :object, class_name: 'Review'
end
