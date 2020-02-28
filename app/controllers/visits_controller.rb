class VisitsController < ApplicationController

  before_action :find_visit, only: :show


  def show
    @visit = Visit.find(params[:id])
    @exhibition = @visit.exhibition
    @message = Message.new
    @message.visit = @visit
    @message.user = current_user
    @subscriptions = @visit.subscriptions
    @current_user = current_user
    @sub = @subscriptions.where(user_id: @current_user.id).first
  end

  def create
    @visit = Visit.new(visit_params)
    @exhibition = Exhibition.find(params[:exhibition_id])
    @visit.exhibition_id = params[:exhibition_id]
    @visit.save
  end

  def new
    @visit = Visit.new
  end


  private

  def find_visit
    @visit = Visit.find(params[:id])
  end

  def visit_params
    params.require(:visit).permit(:date, :information, :meeting_hour)
  end
end


