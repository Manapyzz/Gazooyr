class CommentsController < ApplicationController

  def new
    @comment = Comment.new(comment_params)
  end

  def create
    @comment = Comment.new(comment_params)
    head :no_content
    if @comment.save
      flash[:notice] = "You have successfully registered."
      redirect_to root_path
    else
     return false
    end
  end
  def comment_params
    params.require(:comment).permit(:comment, :new_id)
  end

end
