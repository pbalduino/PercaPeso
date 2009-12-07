# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  include AuthenticatedSystem

  layout 'default'

  protected
  def authorize

    unless User.find_by_id(session[:user_id])
      flash[:notice] = 'Efetue o login'
      redirect_to :root
    end
  end

end
