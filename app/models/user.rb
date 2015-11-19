class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user
  has_many :posts
  has_many :likes, as: :likeable
  has_many :comments, as: :commentable

  mount_uploader :picture, PictureUploader

  validate :picture_size
  

  def get_all_friends # returns a list of friends (user objects)
    id_list = []
    self.friendships.accepted.each {|f| id_list << f.friend_id }
    self.inverse_friendships.accepted.each {|f| id_list << f.user_id }
    friends = User.where('id in (?)', id_list) unless id_list.empty?
  end

  def get_all_friendships # returns a list of friendships
    f_list = []
    self.friendships.accepted.each {|f| f_list << f }
    self.inverse_friendships.accepted.each {|f| f_list << f}
    f_list
  end

  def get_all_friend_requests # returns a list of friendship requets (friendship objects)
    requests = []
    self.outbound_requests.each {|r| requests << r } unless self.outbound_requests.empty?
    self.inbound_requests.each {|r| requests << r } unless self.inbound_requests.empty? 
    requests
  end

  def outbound_requests
    self.friendships.all.pending
  end

  def inbound_requests
    self.inverse_friendships.all.pending 
  end

  def find_friendship(id_a, id_b = self.id) # given two users and without knowledge of the 'direction' of the relationship, find the friendship relation if one exists
    return Friendship.where('user_id = ? AND friend_id = ?', id_a, id_b) unless Friendship.where('user_id = ? AND friend_id = ?', id_a, id_b).empty?
    return Friendship.where('user_id = ? AND friend_id = ?', id_b, id_a) unless Friendship.where('user_id = ? AND friend_id = ?', id_b, id_a).empty?
    return nil
  end

  def get_notifications
    self.inbound_requests
  end

  def feed
    if !self.get_all_friends.nil?
      friend_ids = []
      self.get_all_friends.each {|f| friend_ids << f.id }
      Post.where("user_id IN (#{friend_ids.join(', ')}) OR user_id = :user_id", user_id: id)
    else
      #return empty active relation
      Post.where("user_id = ?", id)
    end
  end

  def friends?(other_id)
    return true if (!Friendship.where('user_id = ? AND friend_id = ? AND accepted = true', other_id, self.id).empty? || !Friendship.where('user_id = ? AND friend_id = ? AND accepted = true', self.id, other_id).empty?)
    false
  end

  def pending_outbound_request?(other_id)
    !outbound_requests.where('friend_id = ?', other_id).empty?
  end

  def pending_inbound_request?(other_id)
    !inbound_requests.where('user_id = ?', other_id).empty?
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      #user.name = auth.info.name   # assuming the user model has a name
      #user.image = auth.info.image # assuming the user model has an image
    end
  end

  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less then 5MB")
      end
    end
end
