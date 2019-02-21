class LectureItemController < ApplicationController
  def show
    @subject1s = Subject1.all
    @subject2s = Subject2.where(subject1_id: params[:id])
    @lecture_items = LectureItem.where(id: params[:id])
    render :show
  end
end
