class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_letter
    @current_letter ||= Letter.find(session[:letter_id]) if session[:letter_id]
  end
end
