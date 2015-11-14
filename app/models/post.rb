class Post < ActiveRecord::Base

  belongs_to :user
  has_many :likes, as: :likeable


  def already_liked_by?(user)
    !Like.where('user_id = ? AND likeable_id = ? and likeable_type = ?', user.id, self.id, self.class.to_s).empty?
  end

  def get_like_id(user)
    Like.where('user_id = ? AND likeable_id = ? and likeable_type = ?', user.id, self.id, self.class.to_s).first.id
  end

end
