class PlansController < ApplicationController
  before_action :authenticate_user!

  def index
    @plan = Plan.order("id desc")
    @goods = Good.all
    
  end

  def show
    @plan = Plan.find(params[:id])
    @user = User.find(@plan.user_id)
    @comment = Comment.where(plan_id: @plan.id).order("id desc")
    @goods = Good.all
    params[:num] = Comment.where(plan_id: @plan.id).count + 1
  end

  def new
    @plan = Plan.new
  end

  def create
    params[:plan][:user_id] = current_user.id
    if request.post? then
      @plan = Plan.create(plan_params)
      redirect_to action: 'show', params:{id: @plan.id}
    else
      redirect_to action: 'index'
    end 
  end

  def plan_params
    params.require(:plan).permit(:user_id, :title, :overview, :detail)
  end
end
