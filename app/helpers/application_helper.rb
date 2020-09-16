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

end
