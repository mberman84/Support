class IssuesController < ApplicationController
  before_filter :is_signed_in, :only => [:create, :new, :edit, :update]
  before_filter :is_owner, :only => [:close, :reopen, :destroy, :close, :update, :edit]
  
  def index
    @issues = Issue.limit(5)
    @apps = App.paginate(:page => params[:page], :per_page => 10)
    
    respond_to do |format|
      format.xml  { render_for_api :default, :xml  => @issues }
      format.json { render_for_api :default, :json => @issues }
      format.html
    end
  end
  
  def show
    @issue = Issue.find(params[:id])
    #@votes = Votership.where(:issue_id => @issue.id)
    @voterships = @issue.voterships
    @comment = Comment.new(:issue_id => @issue.id)
    @current_user_vote = @voterships.where(:user_id => current_user.id).first unless !current_user
    respond_to do |format|
      format.xml  { render_for_api :default, :xml  => @issue }
      format.json { render_for_api :default, :json => @issue }
      format.html
    end
  end
  
  def create
    @app = App.find(params[:app_id])
    @issue = Issue.new(params[:issue])
    @issue.app_id = params[:app_id]
    @issue.owner = @app.owner
    @issue.status = "Open"
    if @issue.save
      redirect_to app_issue_path(@app, @issue), :notice => "Issue added!"
    else
      render 'new', :notice => "Could not add issue"
    end
  end
  
  def edit
    @app = App.find(params[:app_id])
    @issue = Issue.find(params[:id])
    @title = "Edit issue"
  end
  
  def update
    @issue = Issue.find(params[:id])
    if @issue.update_attributes(params[:issue])
      redirect_to app_issues_path(@issue), :notice => "Issue updated!"
    else
      render 'edit', :notice => "Couldn't update issue"
    end
  end
  
  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy
    redirect_to issues_path, :notice => "Issue deleted"
  end
  
  def new
    @app = App.find(params[:app_id])
    @issue = Issue.new
    @title = "New Issue"
  end
  
  def close
    @issue = Issue.find(params[:id])
    @issue.close_issue
    redirect_to :back, :notice => "Issue closed"
  end
  
  def reopen
    @issue = Issue.find(params[:id])
    @issue.reopen_issue
    redirect_to :back, :notice => "Issue reopened"
  end
  
  private
  
    def is_owner
      @issue = Issue.find(params[:id])
      redirect_to :back, :notice => "You do not have permission to do that." unless @issue.is_owner?(current_user)
    end
end