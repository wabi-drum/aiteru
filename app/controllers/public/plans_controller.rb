class Public::PlansController < ApplicationController
  before_action :authenticate_user!

  def index
    @plans = Plan.all 
  end

  def show
    @plan = Plan.find(params[:id])
    @schedules = @plan.schedules.includes(:user)
    @dates = (@plan.starting_date..@plan.ending_date).to_a
  end

  def new
    @plan = Plan.new 
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id
    if @plan.save 
      flash[:notice] = "Great start! Your plan has been created successfully."
      redirect_to plan_path(@plan.id)
    else 
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def plan_params
    params.require(:plan).permit(:starting_date, :ending_date, :place, :title, :detail)
  end 
end
