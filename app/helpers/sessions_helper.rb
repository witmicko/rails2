module SessionsHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    if @current_user.nil?
      @current_user = User.where(remember_token: cookies[:remember_token]).first
    end
    @current_user
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def signed_in_user
    unless signed_in?
      flash[:notice] = "Please sign in"
      redirect_to signin_url
    end
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user?(user)
    user == current_user
  end
end
