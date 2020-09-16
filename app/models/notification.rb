class Notification < ApplicationRecord
  belongs_to :user

  scope :requests, -> { where('notice_type = request') }
end
