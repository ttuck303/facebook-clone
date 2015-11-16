class SelfFriendingValidator < ActiveModel::Validator 
  def validate(record)
    if record.user_id == record.friend_id
      record.errors[:base] << "Self friending not allowed"
    end
  end
end