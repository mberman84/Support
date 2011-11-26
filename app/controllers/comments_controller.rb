class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    if @comment.save
      redirect_to :back, :notice => "Comment added"
    else
      redirect_to :back, :notice => "Could not add comment"
    end
  end
end
