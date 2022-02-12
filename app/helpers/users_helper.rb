module UsersHelper
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?(user)
    true if user && session[:user_id] == user.id
  end
end
