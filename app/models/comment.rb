class Comment < ActiveRecord::Base

  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :user, presence: true
  validates :commentable, presence: true


  

end
