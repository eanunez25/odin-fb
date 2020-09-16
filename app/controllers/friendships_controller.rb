class FriendshipsController < ApplicationController
  include ApplicationHelper

  def create 
    @user = User.find(params[:user_id])
    @friendship = current_user.requests_as_requestor.build(receiver_id: params[:user_id])
    if @friendship.save
      flash[:success] = "Request sent!"
      @notification = new_notification(@user, @current_user.id, 'request')
      @notification.save
    end
  end

  def accept_friend
    @friendship = Friendship.find_by()
  end

end
