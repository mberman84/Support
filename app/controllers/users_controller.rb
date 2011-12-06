class UsersController < ApplicationController
  def index
    @users = User.limit(10)
    
    respond_to do |format|
      format.xml  { render_for_api :name_only, :xml => @users, :root => :users  }
      format.json { render_for_api :name_only, :json => @users, :root => :users }
    end
  end
  
  def show
    @user = User.find(params[:id])
    
    respond_to do |format|
      format.xml  { render_for_api :name_only, :xml  => @user }
      format.json { render_for_api :name_only, :json => @user }
    end
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      auto_login(@user)
      redirect_to root_url, :notice => "Signed up!"
    else
      render :new, :notice => "Could not create user"
    end
  end
end
