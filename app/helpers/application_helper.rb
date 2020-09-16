module ApplicationHelper

  def full_title(page_title = '')
    base_title = "Always Lucky MTG"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end 
  end

  # Returns the new record created in notifications table
  def new_notification(user, notice_id, notice_type)
    notice = user.notifications.build(notice_id: notice_id,   
    notice_type: notice_type)
    # user.notice_seen = false
    user.save
    notice
  end
  
  # Receives the notification object as parameter along with a type
  # and returns a User record, Post record or a Comment record
  # depending on the type supplied 
  def notification_find(notice, type)
    return User.find(notice.notice_id) if type == 'request'
    return Post.find(notice.notice_id) if type == 'comment'
    return Post.find(notice.notice_id) if type == 'like-post'
    return unless type == 'like-comment'
    comment = Comment.find(notice.notice_id)
    Post.find(comment.post_id)
  end

  # checks wheter a post or comment has laready been likey by the 
  # current user, returning either true or false
  def liked?(subject, type)
    result = false
    result = Like.where(user_id: current_user.id, post_id: subject.id)
              .exists? if type == 'post'
    result = Like.where(user_id: current_user.id, comment_id: subject.id)
              .exists? if type == 'comment'
    result
  end



  def friend_request_sent?(user)
    current_user.sent_requests.exists?(receiver_id: user.id, status: false)
  end
  
  def friend_request_received?(user)
    current_user.received_requests.exists?(requestor_id: user.id, status: false)
  end
  
  # Checks whether a user has had a friend request sent to them by the current user or 
  # if the current user has been sent a friend request by the user returning either true or false
  def possible_friend?(user)
    request_sent = current_user.sent_requests.exists?(receiver_id: user.id)
    request_received = current_user.received_requests.exists?(requstor_id: user.id)
    
    return true if request_sent != request_recieved    
    return true if request_sent == request_recieved && request_sent == true    
    return false if request_sent == request_recieved && request_sent == false
  end

end
