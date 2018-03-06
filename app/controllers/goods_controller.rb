class GoodsController < ApplicationController
  def create

    @plan = Plan.find(params[:plan_id])
    @good = Good.create(user_id: current_user.id, plan_id: params[:plan_id])
    @goods = Good.where(plan_id: params[:plan_id])
  end

  def destroy

    @plan = Plan.find(params[:plan_id])
    @good = Good.find_by(user_id: current_user.id, plan_id: params[:plan_id])
    @good.destroy
    @goods = Good.where(plan_id: params[:plan_id])
  end
end
