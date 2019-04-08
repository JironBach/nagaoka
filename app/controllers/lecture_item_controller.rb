class LectureItemController < ApplicationController
  def show
    @subject1s = Subject1.all
    @subject2s = Subject2.where(subject1_id: params[:subject1_id])
    @subject2 = Subject2.find(params[:subject2_id].to_i)
    already = Already.where(subject2_id: params[:id].to_i, user_id: session[:user_id].to_i).first
    already.already = true
    already.save!
    @lecture_item = LectureItem.find(params[:id])
    @alreadies = Already.where(subject1_id: params[:index_id].to_i, user_id: session[:user_id].to_i).all.order(:subject2_id)
  end

  def update
    update_alreadies(params[:already], params[:subject1_id], session[:user_id].to_i)

    @subject1s = Subject1.all
    @subject2s = Subject2.where(subject1_id: params[:subject1_id].to_i)
    @lecture_items = LectureItem.all
    @alreadies = Already.where(subject1_id: params[:index_id].to_i, user_id: session[:user_id].to_i).all.order(:subject2_id)
    redirect_to "#{'/index/'+params[:subject1_id].to_s+'/subject2/'+params[:subject2_id].to_s+'/lecture_item/'+params[:id].to_s}" and return
  end

end
