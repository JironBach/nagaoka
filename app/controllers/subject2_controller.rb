class Subject2Controller < ApplicationController
  def show
    @subject1s = Subject1.all
    @subject2s = Subject2.where(subject1_id: params[:id])
    @subject2 = Subject2.find(params[:id])
    @lecture_item = LectureItem.find(params[:id])
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
    @lecture_items = LectureItem.all
    render :show
  end

end
