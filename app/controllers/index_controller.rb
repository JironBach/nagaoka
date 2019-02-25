class IndexController < ApplicationController
  def show
    @subject1s = Subject1.all
    @subject2s = Subject2.where(subject1_id: params[:id])
    @subject2 = Subject2.find(0)
    render :show
  end

  def update
    Subject2.all.each do | subject2 |
      if params[:subject2].nil?
        subject2.already = false
      else
        if params[:subject2][:id].include?(subject2.id.to_s)
          subject2.already = true
        else
          subject2.already = false
        end
      end
      subject2.save!
    end

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
    params.require(:index_id).permit(:subject2, [:subject2][:index_id])
  end

end
