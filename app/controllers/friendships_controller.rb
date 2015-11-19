class FriendshipsController < ApplicationController

  before_action :authenticate_user!

  def create # send a friend request
    @user = current_user
    @friendship = @user.friendships.build
    @friendship.friend = User.find(params[:friend])
    @friendship.save
    flash[:success] = "Friend request sent!"
    redirect_to :back
  end

  def destroy # destroy a friendship or a request
   @friendship = current_user.find_friendship(params[:friend])
   @friendship.destroy(@friendship[0].id)
   redirect_to current_user
  end

  def update # accept a friendship request  
    @friendship = Friendship.find(params[:friendship])
    @friendship.accepted = true
    if @friendship.save
      flash[:success] = "New friend added!"
      redirect_to current_user
    else
      flash[:danger] = "Error adding friend."
      render current_user
    end
  end

  
  private

  def friendship_params
    params.require(:friendship).permit(:id, :user_id, :friend_id)
  end

end
