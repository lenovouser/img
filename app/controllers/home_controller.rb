class HomeController < ApplicationController

  def index
    unless current_session.nil?
      @images = Image.where(:session_id => current_session.id).order(:id => :desc)
    else
      @images = []
    end
    @image = Image.new
  end

end
