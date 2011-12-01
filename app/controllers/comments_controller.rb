class CommentsController < ApplicationController
  before_filter :is_signed_in, :only => [:create, :destroy]
  before_filter :is_owner, :only => [:destroy]
  
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    if @comment.save
      redirect_to :back, :notice => "Comment added!"
    else
      redirect_to :back, :notice => "Could not add comment"
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to :back, :notice => "Comment deleted!"
    else
      redirect_to :back, :notice => "Could not delete comment"
    end
  end
  
  private
    
    def is_owner
      @comment = Comment.find(params[:id])
      redirect_to :back, :notice => "You cannot delete someone else's comment" unless @comment.user == current_user
    end
end
