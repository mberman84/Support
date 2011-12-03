class AppsController < ApplicationController
  before_filter :is_signed_in, :only => [:create, :new]
  before_filter :is_owner, :only => [:destroy]
  
  def index
    @apps = App.paginate(:page => params[:page], :per_page => 15)
  end
  
  def show
    @app = App.find(params[:id])
    @issues = @app.issues.paginate(:page => params[:page], :per_page => 10)
    
    respond_to do |format|
      format.xml  { render_for_api :default, :xml  => @app }
      format.json { render_for_api :default, :json => @app }
      format.html
    end
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
  
  def edit
    @app = App.find(params[:id])
    @title = "Edit app"
  end
  
  def update
    @app = App.find(params[:id])
    if @app.update_attributes(params[:app])
      redirect_to app_path(@app), :notice => "App updated!"
    else
      render 'edit', :notice => "Couldn't update app"
    end
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