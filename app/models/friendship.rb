class Friendship < ActiveRecord::Base

  scope :accepted, -> { where ( 'accepted = true' ) }
  scope :pending, -> { where ( 'accepted = false' ) }

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user_id, presence: true
  validates :friend_id, presence: true
  validates_uniqueness_of :user_id, scope: :friend_id

  include ActiveModel::Validations
  validates_with UniqueFriendshipValidator
  validates_with SelfFriendingValidator
end

