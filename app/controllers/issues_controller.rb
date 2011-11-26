class IssuesController < ApplicationController
  before_filter :is_signed_in, :only => [:create, :new, :close]
  before_filter :is_owner, :only => [:close, :reopen]
  
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
    @issue.owner = @app.owner
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
  
  def close
    @issue = Issue.find(params[:id])
    @issue.close_issue
    redirect_to :back
  end
  
  def reopen
    @issue = Issue.find(params[:id])
    @issue.reopen_issue
    redirect_to :back
  end
  
  private
  
    def is_owner
      @issue = Issue.find(params[:id])
      redirect_to :back unless @issue.owner == current_user
    end
    
    def is_signed_in
      redirect_to login_path unless signed_in?
    end
    
    def signed_in?
      !current_user.nil?
    end
end