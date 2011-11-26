class AppsController < ApplicationController
  before_filter :is_signed_in, :only => [:create, :new]
  before_filter :is_owner, :only => [:destroy]
  
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
      redirect_to @app, :notice => "App created!"
    else
      render 'new', :notice => "Could not create app"
    end
  end
  
  def destroy
    @app = App.find(params[:id])
    @app.destroy
    redirect_to issues_path, :notice => "App deleted"
  end
  
  def new
    @app = App.new
    @title = "New App"
  end
  
  private
    
    def is_owner
      @app = App.find(params[:id])
      redirect_to :back, :notice => "You do not have permission to do that" unless @app.is_owner?(current_user)
    end
end