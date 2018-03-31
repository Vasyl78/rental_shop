# == Schema Information
#
# Table name: cities
#
#  id    :integer          not null, primary key
#  title :string
#

class City < ApplicationRecord
  has_many :users
  has_many :items
end
