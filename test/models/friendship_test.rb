require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
 
  def setup
    @friendship = Friendship.new(user_id: 1, friend_id: 2)
  end

  test "should require a user id" do 
    @friendship.user_id = nil
    assert_not @friendship.valid?
  end

  test "should require a friend id" do
  @friendship.friend_id = nil
  assert_not @friendship.valid? 
  end

  test "friendship should be unique" do
    @friendship.save
    @friendship_2 = Friendship.new(user_id: 1, friend_id: 2)
    assert_not @friendship_2.valid?
  end

  test "inverse friendships should be unique" do
    @friendship.save
    @friendship_3 = Friendship.new(user_id: 2, friend_id: 1)
    assert_not @friendship_3.valid?
  end


  test "should prevent self-friending" do
    @friendship_4 = Friendship.new(user_id: 1, friend_id: 1)
    assert_not @friendship_4.valid?
  end


end
