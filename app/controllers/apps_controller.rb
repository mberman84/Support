class AppsController < ApplicationController
  def index
    @apps = App.limit(10)
  end
  
  def show
    @app = App.find(params[:id])
  end
  
  def create
    @app = App.new(params[:app])
    @app.owner = current_user
    if @app.save
      flash[:success] = "App created!"
      redirect_to @app
    else
      render 'new'
    end
  end
  
  def new
    @app = App.new
    @title = "New App"
  end
end