class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @friends = @user.get_all_friends
    @requests = @user.get_all_friend_requests
    @post = current_user.posts.build
    @feed_items = current_user.feed
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:id)
  end


end
