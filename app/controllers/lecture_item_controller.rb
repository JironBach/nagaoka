class LectureItemController < ApplicationController
  def show
    @subject1s = Subject1.all
    @subject2s = Subject2.where(subject1_id: params[:subject2_id])
    @lecture_item = LectureItem.find(params[:id])
    render :show
  end
end
