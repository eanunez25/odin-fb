class UsersController < ApplicationController

  def index 
    @users = User.all
    @friends = current_user.friends
    @pending_requests = current_user.sent_requests
    @friend_requests = current_user.received_requests
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all.order('created_at DESC')
  end

end