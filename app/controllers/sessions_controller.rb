class SessionsController < ApplicationController
  def create
    user = Userfb.from_omniauth(env["omniauth.auth"])
    session[:userfb_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:userfb_id] = nil
    redirect_to root_url
  end
end