class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_session
    @current_session ||= ActiveRecord::SessionStore::Session.where(:session_id => request.session_options[:id]).first
    @current_session
  end

end
