class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  scope :friends, -> { where('status = ?', true) }
  scope :not_friends, -> { where('status = ?', false) }
end
