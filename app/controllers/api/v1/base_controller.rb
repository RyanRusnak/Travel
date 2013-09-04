class Api::V1::BaseController < ActionController::Base
  respond_to :json

  before_filter :restrict_access

  private

  def restrict_access
    return if current_user

    head :unauthorized
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def render_404
    render :json => {:error => "not-found"}.to_json, status: 404
  end

  def respond_with_namespace(*resource)
    respond_with(:api, :v1, *resource)
  end
end
