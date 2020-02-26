class IndexController < ApplicationController
  before_action :require_login, except: [:index, :regist, :login]

  def index
    session[:tmp_update] = false
    reset_session unless signed_in?
    session[:index_id] = params[:id]
    @subject1s = Subject1.all
    render :index
  end

  def regist
    session[:index_id] = params[:id]
    if params[:username].blank?
      redirect_to '/'
      return
    else
      user = User.where(name: params[:username]).first
      if user.nil?
        user = User.new(name: params[:username])
        user.save!
        regist_alreadies(user.id)
      end
    end
    session[:user_id] = user.id.to_s
    @subject1s = Subject1.all
    @subject2s = Subject2.where(subject1_id: params[:id]).all
    @lecture_item = LectureItem.find(params[:id].to_i)
    @alreadies = Already.where(user_id: params[:id].to_i).all
    redirect_to "/index/#{params[:id]}"
  end

  def login
    session[:index_id] = params[:id]
    if params[:username].blank?
      redirect_to '/'
      return
    elsif
      user = User.where(name: params[:username]).first
      if user.nil?
        session[:index_id] = params[:id]
        redirect_to "/index/#{params[:id]}"
        return
      elsif
        session[:user_id] = user.id.to_s
        @subject1s = Subject1.all
        @subject2s = Subject2.where(subject1_id: params[:id]).all
        @lecture_item = LectureItem.find(params[:id].to_i)
        session[:index_id] = params[:id]
        redirect_to "/index/#{params[:id]}"
      end
    end
    user
  end

  def show
    session[:index_id] = params[:id]
    @subject1s = Subject1.all
    @subject2s = Subject2.where(subject1_id: params[:id].to_i).all
    @lecture_item = LectureItem.find(Subject2.where(subject1_id: params[:id].to_i).first.id)
    render :show
  end

  def post
    session[:index_id] = params[:id]
    session[:tmp_update] = true
    update_alreadies(params[:already], params[:id].to_i, current_user.id) if signed_in?
    @subject2s = Subject2.where(subject1_id: params[:subject1_id]).all
    @lecture_items = LectureItem.all
    session[:index_id] = params[:id]
    redirect_to "/index/#{params[:id]}/subject2/0/lecture_item/0/"
  end

  def sign_out!
    reset_session

    render :index
  end

end
