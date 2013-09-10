class SessionsController < ApplicationController

  # def create
  #    auth = request.env["omniauth.auth"]
  #    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
  #    session[:user_id] = user.id
  #    redirect_to root_url, :notice => "Signed in!"
  #  end

  #  def destroy
  #    session[:user_id] = nil
  #    redirect_to root_url, :notice => "Signed out!"
  #  end

  def create
    auth = request.env["omniauth.auth"]
    
    if auth
      user = User.where(:provider => auth['provider'], :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)

      # Reset the session after successful login, per
      # 2.8 Session Fixation – Countermeasures:
      # http://guides.rubyonrails.org/security.html#session-fixation-countermeasures
      reset_session

      session[:user_id] = user.id

      if user.email.blank?
        redirect_to edit_user_path(user), :alert => "Please enter your email address."
      else
        redirect_to root_url, :notice => 'Signed in!'
      end
    else
      redirect_to root_url, :notice => 'Failed to signed in. Please try it again.'
    end
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end
end
