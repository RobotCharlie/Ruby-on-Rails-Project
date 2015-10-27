class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  # check before you go to the index action, if you have user_id already, then go to index,
  # if not, you will be redirected to login action (wherever you were now)
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in"
      redirect_to(:controller => 'access', :action => 'login')
      return false
    else
      return true
    end
  end


end
