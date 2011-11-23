class VotershipsController < ApplicationController
  def create
    session[:return_to] = request.referrer
    @issue = Issue.find(params[:votership][:issue_id])
    @issue.cast_vote_up!(current_user.id, "up")
    redirect_to session[:return_to]
  end
  
  def cast_vote_down
    
  end

  def destroy
    #session[:return_to] = request.referrer
    #@user = Relationship.find(params[:id]).followed
    #current_user.unfollow!(@user)
  end
end