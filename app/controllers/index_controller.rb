class IndexController < ApplicationController
  def index
    @subject1s = Subject1.all
    @subject2s = Subject2.where(id: params[:id])
    render :index
  end
end
