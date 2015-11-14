class LikesController < ApplicationController

  def create 
    @like = Like.new(user_id: params[:user_id], likeable_id: params[:likeable_id], likeable_type: params[:likeable_type])
    if @like.save
      redirect_to :back
    else
      flash[:danger] = "Can't like this item."
      redirect_to :back
    end
  end

  def destroy
    @like = Like.find(params[:like_id])
    @like.destroy
    redirect_to :back
  end
end
