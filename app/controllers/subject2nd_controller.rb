class Subject2ndController < ApplicationController
  def show
    @subject1s = Subject1.all
    @subject2s = Subject2.where(id: params[:id])
    render :show
  end
end
