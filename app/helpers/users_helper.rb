module UsersHelper
  def current_user
    User.find_by remember_token: cookies[:remember_token] if cookies[:remember_token]
  end

  def logged_in?(user)
    true if user && cookies[:remember_token] == user.remember_token
  end
end
