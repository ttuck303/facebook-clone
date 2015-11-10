class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :outbound_requests, class_name: "FriendRequest", foreign_key: "requestor_id", dependent: :destroy
  has_many :inbound_requests, class_name: "FriendRequest", foreign_key: "requestee_id"


end
