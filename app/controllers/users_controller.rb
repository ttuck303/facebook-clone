class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @friends = @user.get_all_friends
    @requests = @user.get_all_friend_requests
  end


  private

  def user_params
    params.require(:user).permit(:id)
  end


end
