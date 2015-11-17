class Comment < ActiveRecord::Base

  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :likes, as: :likeable

  validates :user, presence: true
  validates :commentable, presence: true
  validates :body, presence: true


  def already_liked_by?(user) # TO-DO not DRY, where can I put this method so that all likeable objects can use it?
    !Like.where('user_id = ? AND likeable_id = ? and likeable_type = ?', user.id, self.id, self.class.to_s).empty?
  end

  def get_like_id(user)
    Like.where('user_id = ? AND likeable_id = ? and likeable_type = ?', user.id, self.id, self.class.to_s).first.id
  end

end
