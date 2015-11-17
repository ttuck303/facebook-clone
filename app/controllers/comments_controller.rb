class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_commentable, only: :create

  def edit
  end

  def create 
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    @comment.save
    redirect_to :back, notice: "Your comment was successfully posted."
  end

  def destroy 
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end

  def edit
    @comment = Comment.find(params[:id])
  end
  
  private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def set_commentable
      @commentable = Post.find(params[:post_id])
    end

end
