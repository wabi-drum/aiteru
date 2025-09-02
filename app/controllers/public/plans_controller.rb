class Public::PlansController < ApplicationController
  def index
    @plans = Plan.all 
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def new
    @plan = Plan.new 
  end

  def create
    @plan = Plan.new()
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
