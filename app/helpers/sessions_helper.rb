module SessionsHelper

  def log_in_user(user)
    session[:session_token] = user.session_token
  end

  def logged_in?
    !!current_user
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def ensure_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def log_out
    current_user.reset_session_token!
    session[:session_token] = nil
  end
end
