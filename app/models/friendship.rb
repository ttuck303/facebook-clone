class Friendship < ActiveRecord::Base

  scope :accepted, -> { where ( 'accepted = true' ) }
  scope :pending, -> { where ( 'accepted = false' ) }

  belongs_to :user
  belongs_to :friend, class_name: 'User'


end
