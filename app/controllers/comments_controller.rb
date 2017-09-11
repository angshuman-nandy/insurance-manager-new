class CommentsController < ApplicationController
before_action :logged_in_user


def index
  @policy_id = params[:policy_id]
  if(@policy_id.nil?)
    redirect_to policies_path
  else
    @comments = Comment.where(policy_id: @policy_id)
  end
end

def new
  @policy_id = params[:policy_id]
  if(@policy_id.nil?)
    redirect_to policies_path
  else
    @comment = Comment.new()
  end
end

def create
 @comment = Comment.new(comment_params)
 @policy_id = @comment.policy_id
  if @comment.save
   redirect_to comments_path(policy_id: @policy_id)
  else
    render "new"
  end
end


def destroy
  @comment = Comment.find(params[:id])
  @p_id = @comment.policy_id
  @comment.destroy
  redirect_to comments_path(policy_id: @p_id)
end


private

def comment_params
  params.require(:comment).permit(:body,:policy_id,:user_id) 
end



end
