module UserSessionsHelper
  
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end
  
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
  
end
