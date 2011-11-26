module SessionsHelper
  def is_signed_in
    redirect_to login_path unless signed_in?
  end
  
  def signed_in?
    !current_user.nil?
  end
end
