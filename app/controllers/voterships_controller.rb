class VotershipsController < ApplicationController
  def create
    session[:return_to] = request.referrer
    @issue = Issue.find(params[:issue_id])
    @issue.cast_vote_up!(current_user.id, "up")
    redirect_to session[:return_to]
  end

  def destroy
    session[:return_to] = request.referrer
    @vote = Votership.find(params[:id])
    @issue = Issue.find(@vote.issue_id)
    @issue.cancel_vote!(current_user.id)
    redirect_to session[:return_to]
  end
end