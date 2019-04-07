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

  def regist_alreadies(user_id)
    user = User.find(user_id)
    unless user.nil?
      Subject2.all.each do |subject2|
        already = Already.new(subject1_id: subject2.subject1_id, subject2_id: subject2.id, user_id: user_id, name: subject2.name, image: LectureItem.find(subject2.subject1_id).image, link: subject2.link)
        already.save!
      end
    end
  end
end
