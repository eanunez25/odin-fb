module ApplicationHelper

  def full_title(page_title = '')
    base_title = "Always Lucky MTG"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end 
  end

  # returns the new record created in the notifications table
  def new_notification(user, notice_id, notice_type)
    notice = user.notifications.build(notice_id: notice_id, notice_type: notice_type)
    # user.notice_seen = false
    user.save
    notice
  end

  # receives the notification object as parameter along with a type
  # and returns a user record, post record, or a comment record
  # depending on type supplied
  def notifictation_find
    return User.find(notice.notice_id) if type == "request"
  end

end
