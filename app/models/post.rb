class Post < ActiveRecord::Base

  belongs_to :user
  has_many :likes, as: :likeable
  has_many :comments, as: :commentable

  mount_uploader :picture, PictureUploader

  validate :picture_size

  validates :user_id, presence: true
  validates :body, presence: true

  def already_liked_by?(user)
    !Like.where('user_id = ? AND likeable_id = ? and likeable_type = ?', user.id, self.id, self.class.to_s).empty?
  end

  def get_like_id(user)
    Like.where('user_id = ? AND likeable_id = ? and likeable_type = ?', user.id, self.id, self.class.to_s).first.id
  end

  def get_comments
    self.comments.all
  end

  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, 'picture cannot exceed 5 MB')
      end
    end
end
