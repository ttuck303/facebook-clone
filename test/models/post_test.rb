require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @user = users(:deandra)
    @post = @user.posts.build(title: "Jokes on Dee", body: "Chirp chirp chirp")
  end

  test 'should be valid' do 
    assert @post.valid?
  end

  test 'user id should be present' do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test 'body (content) should be present' do
    @post.body = nil
    assert_not @post.valid?
  end

  


end
