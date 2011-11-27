class HomeController < ApplicationController
  def index
    @issues = Issue.find( :all, 
                          :order => "count(comments.id) DESC", 
                          :joins => "inner join comments on comments.issue_id = issues.id", 
                          :group => "issues.id",
                          :limit => "10" )
  end
end
