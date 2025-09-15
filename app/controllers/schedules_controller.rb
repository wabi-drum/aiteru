class SchedulesController < ApplicationController
  before_action :authenticate_user!

  def create
    @plan = Plan.find(params[:plan_id])
    @schedule = @plan.schedules.new(schedule_params)
    @schedule.user = current_user
    if @schedule.save
      redirect_to @plan, notice: "Your availability has been submitted."
    else 
      redirect_to @plan, alert: "Failed to submit availability."
    end 
  end

  private

  def schedule_params
    params.require(:schedule).permit(:date_time, :status)
  end 

end
