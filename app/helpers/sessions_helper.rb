module SessionsHelper
  def is_signed_in
    redirect_to login_path, :notice => "Please sign in to do that." unless signed_in?
  end
  
  def signed_in?
    current_user
  end
end
