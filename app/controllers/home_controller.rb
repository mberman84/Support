class HomeController < ApplicationController
  def index

    @issues = Issue.limit(10)
  end
end
