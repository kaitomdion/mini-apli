class CommentsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @comment = Comment.all.order("id DESC").page(params[:page]).per(6)
  end

  def new
    @comment = Comment.new
  end

  def create
    Comment.create(text: comment_params[:text], user_id: current_user.id)
    redirect_to action: :index
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.user_id == current_user.id
      comment.destroy
      redirect_to action: :index
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    if comment.user_id == current_user.id
      comment.update(comment_params)
      redirect_to action: :index
    end
  end


private
def comment_params
  params.require(:comment).permit(:text)
end

def move_to_index
  redirect_to action: :index unless user_signed_in?
end

end
