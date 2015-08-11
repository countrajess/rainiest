class HomeController < ApplicationController
  def index
  end

  def create
    user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = user.id
    head :ok, content_type: "text/html"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
