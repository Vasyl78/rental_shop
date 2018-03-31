# == Schema Information
#
# Table name: items
#
#  id      :integer          not null, primary key
#  name    :string
#  user_id :integer
#

class Item < ApplicationRecord
  belongs_to :user
  has_many   :bookings
  has_many   :reviews, as: :object

  validates :name, presence: true
end
