class IssuesController < ApplicationController
  def index
    @app_id = params[:app_id]
    if !params[:app_id].blank?
      @all_index = true
      @issues = Issue.where(:app_id => params[:app_id])
    else
      @all_index = false
      @issues = Issue.limit(10)
    end
  end
  
  def show
     @issue = Issue.find(params[:id])
  end
  
  def create
    @app = App.find(params[:app_id])
    @issue = Issue.new(params[:issue])
    @issue.app_id = params[:app_id]
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