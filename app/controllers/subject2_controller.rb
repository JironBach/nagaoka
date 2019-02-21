class Subject2Controller < ApplicationController
  def show
    @subject1s = Subject1.all
    @subject2s = Subject2.where(subject1_id: params[:id])
    render :show
  end
end
