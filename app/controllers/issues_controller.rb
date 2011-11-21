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
end