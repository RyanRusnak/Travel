class Api::V1::LocationsController < Api::V1::BaseController  
  def index
    render json: current_user.format_globe_data
  end
end
