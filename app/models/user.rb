class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user
  has_many :posts
  

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

    def get_all_friends_and_friendships # returns an array [friend, frienship]

    end

    def get_all_friend_requests # returns a list of friendship requets (friendship objects)
      requests = []
      self.outbound_requests.each {|r| requests << r } unless self.outbound_requests.empty?
      self.inbound_requests.each {|r| requests << r } unless self.inbound_requests.empty? 
      requests
    end

    def outbound_requests
      outbound_requests = self.friendships.all.pending
    end

    def inbound_requests
      inbound_requests = self.inverse_friendships.all.pending 
    end


    def accept_friend_request
      
    end

    def decline_friend_request
    end

    def find_friendship(id_a, id_b = self.id) # given two users and without knowledge of the 'direction' of the relationship, find the friendship relation if one exists
      return Friendship.where('user_id = ? AND friend_id = ?', id_a, id_b) unless Friendship.where('user_id = ? AND friend_id = ?', id_a, id_b).empty?
      return Friendship.where('user_id = ? AND friend_id = ?', id_b, id_a) unless Friendship.where('user_id = ? AND friend_id = ?', id_b, id_a).empty?
      return nil
    end

    def get_notifications
      self.inbound_requests
    end
end
