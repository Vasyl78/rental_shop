# == Schema Information
#
# Table name: reviews
#
#  id          :integer          not null, primary key
#  title       :string
#  body        :text
#  object_id   :integer
#  object_type :string
#  user_id     :integer
#

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :object, polymorphic: true

  validate :comment_user, if: :user?
  validate :comment_item, if: :item?

  private

  def comment_user
    unless can_comment_user?
      errors.add(:object, 'You can not write review for this user')
    end
  end

  def comment_item
    unless can_comment_item?
      errors.add(:object, 'You can not write review for this item')
    end
  end

  def user?
    object_type == 'User'
  end

  def item?
    object_type == 'Item'
  end

  def can_comment_user?
    return unless object_type == 'User'
    user.bookings.map { |b| b.item.user_id }.include?(object_id)
  end

  def can_comment_item?
    return unless object_type == 'Item'
    user.bookings.map(&:item_id).include?(object_id)
  end
end
