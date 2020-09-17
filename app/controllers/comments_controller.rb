class CommentsController < ApplicationController
  include ApplicationHelper

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id]) 
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = 'Comment created'
      @notification = new_notification(@post.user, @post.id, 'comment')
      @notification.save
    end
    redirect_to @post
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy
    flash[:success] = 'Comment deleted'
    redirect_to post_path(@comment.post.id)
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end

end
