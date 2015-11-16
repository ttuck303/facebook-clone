class UniqueFriendshipValidator < ActiveModel::Validator 
  def validate(record)
     @temp_friendship = Friendship.where('user_id = ? AND friend_id = ?', record.friend_id, record.user_id)
     record.errors[:base] << "Inverse friendship already exists" if @temp_friendship.exists?
  end
end