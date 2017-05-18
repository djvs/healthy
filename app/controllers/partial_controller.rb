class PartialController < ApplicationController
  def partial
    begin
      puts params[:partial]
      render "partial/#{params[:partial].gsub(/[^a-zA-Z0-9 _-]/,'')}", :layout => false
    rescue => e
      puts e.message
      puts e.backtrace
      render text: "Whoa!  No partial there."
    end
  end
end
