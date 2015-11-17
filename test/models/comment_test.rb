require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = users(:deandra)
    @post = @user.posts.build(body: "Shake it like a polaroid picture")
    @post.save
    @comment = @post.comments.build(user: @user, body: "best song evaaah")
  end

  test "comment requires user id" do 
    @comment.user_id = nil
    assert_not @comment.valid?
  end

  test "comment requires commentable id" do 
    @comment.commentable_id = nil
    assert_not @comment.valid?
  end

  test "comment requires commentable type" do 
    @comment.commentable_type = nil
    assert_not @comment.valid?
  end

  test "comment requires body" do 
    @comment.body = nil
    assert_not @comment.valid?
  end

  test "comment requires body to be non empty" do 
    @comment.body = "   "
    assert_not @comment.valid?
  end

  test "comment requires user to be logger in" do
  end

end
