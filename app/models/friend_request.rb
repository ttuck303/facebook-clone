class FriendRequest < ActiveRecord::Base

  belongs_to :requestee, class_name: 'User'
  belongs_to :reqestor, class_name: 'User'
end
