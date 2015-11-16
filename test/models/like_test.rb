require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:deandra)
    @post = @user.posts.build(body: "We hold these truths to be self evident")
    @like = @post.likes.build(user: @user)
  end

  test "like should have a user_id" do 
    @like.user = nil
    assert_not @like.valid?
  end

  test "like should have a likeable_id" do 
    @like.likeable_id = nil
    assert_not @like.valid?
  end

  test "like should have a likeable_type" do
    @like.likeable_type = nil
    assert_not @like.valid?
  end

  test "like should be unique across user and likeable object" do 
    @like.save
    @like_2 = @post.likes.build(user: @user)
    assert_not @like_2.valid?
  end

  test "should display like link on likeable objects" do 
  end

  test "should display unlike link on posts that have already been liked" do 
  end

  test "should display total likes for a post" do
  end

  test "should be signed- in in order to like an object" do
  end
  
end
