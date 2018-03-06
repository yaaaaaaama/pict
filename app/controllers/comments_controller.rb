class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    puts params[:plan_id]
    params[:comment][:plan_id] = params[:plan_id]
    params[:comment][:user_id] = current_user.id
    if request.post? then
      @comment = Comment.create(comment_params)
      redirect_to controller: 'plans', action: 'show', params:{id: @comment.plan_id}
    else
      redirect_to action: 'index'
    end 
  end

  def comment_params
    params.require(:comment).permit(:plan_id, :user_id, :content)
  end
end
