module SessionsHelper
  def is_signed_in
    redirect_to login_path unless is_signed_in?
  end
  
  def is_signed_in?
    !current_user.nil?
  end
end
