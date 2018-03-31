# == Schema Information
#
# Table name: bookings
#
#  id         :integer          not null, primary key
#  start_date :date
#  end_date   :date
#  user_id    :integer
#  item_id    :integer
#

class Booking < ApplicationRecord
  belongs_to :item
  belongs_to :user
end
