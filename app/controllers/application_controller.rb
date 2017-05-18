class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # just displays a blank ui-router fill in
  def index
    respond_to do |format|
      format.html {render 'index'}
    end
  end
end
