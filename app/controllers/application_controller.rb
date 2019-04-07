require 'redis'

class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :signed_in?, :sign_out!

  def current_user
    if session[:user_id].blank?
      user = nil
    else
      begin
        user = User.find(session[:user_id].to_i)
      rescue
        user = nil
      end
    end
    user
  end

  #戻り値がt/fとなるときはメソッドに？をつける
  def signed_in?
    !current_user.nil?
  end

  #オブジェクトそのものを書き換えるときは！をつける(破壊的メソッド)
  def sign_out!
    reset_session
  end

end
