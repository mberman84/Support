class AppsController < ApplicationController
  #before_filter :is_owner
  before_filter :is_signed_in, :only => [:create,
                                         :new]
  
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
  
  def destroy
    @app = App.find(params[:id])
    @app.destroy
    redirect_to issues_path
  end
  
  def new
    @app = App.new
    @title = "New App"
  end
  
  private
    
    def is_owner
      @app = App.find(params[:id])
      redirect_to :back unless @app.owner == current_user
    end
end