class IssuesController < ApplicationController
  def index
    @issues = Issue.limit(10)
  end
  
  def show
     @issue = Issue.find(params[:id])
  end
end