class IndexController < ApplicationController
  def index
    @subject1s = Subject1.all
    render :index
  end

  def regist
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
    @subject2s = Subject2.where(subject1_id: params[:id])
    @lecture_item = LectureItem.find(params[:id].to_i)
    @alreadies = Already.where(user_id: params[:id].to_i).all
    redirect_to '/index/0'
  end

  def login
    if params[:username].blank?
      redirect_to '/'
      return
    elsif
      user = User.where(name: params[:username]).first
      if user.nil?
        redirect_to '/'
        return
      elsif
        session[:user_id] = user.id.to_s
        @subject1s = Subject1.all
        @subject2s = Subject2.where(subject1_id: params[:id])
        @lecture_item = LectureItem.find(params[:id].to_i)
        redirect_to '/index/0'
      end
    end
    user
  end

  def sign_out!
    reset_session
    redirect_to '/'
  end

  def show
    @subject1s = Subject1.all
    @subject2s = Subject2.where(subject1_id: params[:id])
    @lecture_item = LectureItem.find(params[:id].to_i)
    render :show
  end

  private

  def submit1_params
    params.require(:subject1_id).permit(:id)
  end

  def submit2_update_params
    params.require(:subject1_id).permit(:subject2, [:subject2][:subject1_id])
  end

end
