class Public::PlansController < ApplicationController
  def index
    @plans = Plan.all 
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def new
    @post = Post.new 
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
