class IssuesController < ApplicationController
  def index
    @issues = Issue.limit(10)
    @apps = App.limit(10)
  end
  
  def show
    @issue = Issue.find(params[:id])
    @votes = Votership.where(:issue_id => @issue.id)
    @current_user_vote = @votes.where(:user_id => current_user.id).first
    @comment = Comment.new(:issue_id => @issue.id)
  end
  
  def create
    @app = App.find(params[:app_id])
    @issue = Issue.new(params[:issue])
    @issue.app_id = params[:app_id]
    debugger
    if @issue.save
      flash[:success] = "Issue added!"
      redirect_to app_issue_path(@app, @issue)
    else
      render 'new'
    end
  end
  
  def new
    @app = App.find(params[:app_id])
    @issue = Issue.new
    @title = "New Issue"
  end
end