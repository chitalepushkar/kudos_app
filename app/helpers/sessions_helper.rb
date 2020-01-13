module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # Redirects to login page if user session not found.
  def authenticate_user!
    redirect_to '/login' if !logged_in?
  end

  def full_name(user)
    "#{user.first_name} #{user.last_name}"
  end

 # Adds CSS class to higlight currently active page link
 def active_class(link_path)
  current_page?(link_path) ? "active" : ""
 end
end
