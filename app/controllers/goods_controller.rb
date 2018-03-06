class GoodsController < ApplicationController
  def create

    pp 'create'
    pp params
    
    @good = Good.create(user_id: current_user.id, plan_id: params[:plan_id])
    @goods = Good.where(plan_id: params[:plan_id])
    puts params[:plan_id]
  end

  def destroy
    
    pp 'destory'
pp params

    good = Good.find_by(user_id: current_user.id, plan_id: params[:plan_id])
    good.destroy
    @goods = Good.where(plan_id: params[:plan_id])
  end
end
