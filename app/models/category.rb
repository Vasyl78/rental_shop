# == Schema Information
#
# Table name: categories
#
#  id   :integer          not null, primary key
#  name :string
#

class Category < ApplicationRecord
  has_many :items
  validates_uniqueness_of :name
end
