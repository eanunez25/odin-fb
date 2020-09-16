class StaticPagesController < ApplicationController
  def home
    @user = current_user
    @posts = @user.friends_and_own_posts.sort_by { |p| p[:create_at] }.reverse if user_signed_in?
    @post = Post.new
    @comment = Comment.new
  end
end
