class VotershipsController < ApplicationController
  before_filter :is_signed_in, :only => [:create, :destroy]
  
  def create
    @issue = Issue.find(params[:issue_id])
    @issue.cast_vote_up!(current_user.id, "up")
    redirect_to :back, :notice => "Voted up!"
  end

  def destroy
    @vote = Votership.find(params[:id])
    @issue = Issue.find(@vote.issue_id)
    @issue.cancel_vote!(current_user.id)
    redirect_to :back, :notice => "Vote cancelled"
  end
end