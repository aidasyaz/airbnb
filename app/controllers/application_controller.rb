class ApplicationController < ActionController::Base
  include Clearance::Controller

  
  def allowed?(action: , user: )
  	
  end

end
