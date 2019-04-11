class LectureItemController < ApplicationController
  def show
    @subject1s = Subject1.all
    @subject2s = Subject2.where(subject1_id: params[:index_id]).all
    @subject2 = Subject2.find(params[:subject2_id].to_i)
    if !session[:tmp_update]
      already = Already.where(subject2_id: params[:id].to_i, user_id: current_user).first
      already.already = true
      already.save!
    end
    session[:tmp_update] = false
    @lecture_item = LectureItem.find(params[:id])
  end

  def update
    logger.debug "debug:current_user="+current_user.inspect
    session[:tmp_update] = true
    update_alreadies(params[:already], params[:index_id].to_i, current_user.id)
    @subject1s = Subject1.all
    @subject2s = Subject2.where(subject1_id: params[:index_id].to_i).all
    @lecture_items = LectureItem.all
    redirect_to "#{'/index/'+session[:index_id].to_s+'/subject2/'+params[:subject2_id].to_s+'/lecture_item/'+params[:id].to_s}" and return
  end

end
