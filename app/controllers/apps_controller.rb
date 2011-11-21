class AppsController < ApplicationController
  def index
    @apps = App.limit(10)
  end
  
  def show
    @app = App.find(params[:id])
  end
end