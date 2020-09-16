class UsersController < ApplicationController
  def index 
    @users = User.all
    @friends = current_user.friends
    @pending_requests = current_user.requests_as_requestor
    @friend_requests = current_user.requests_as_receiver
  end
end