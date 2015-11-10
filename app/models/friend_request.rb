class FriendRequest < ActiveRecord::Base

  belongs_to :requestee, class_name: 'User'
  belongs_to :reqestor, class_name: 'User'

  validates :requestee_id, presence: true
  validates :requestor_id, presence: true
  
end
