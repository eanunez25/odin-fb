class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sent_requests, foreign_key: :requestor_id, class_name: "Request"
  has_many :received_requests, foreign_key: :receiver_id, class_name: "Request"

  has_many :friends, -> { merge(Friendship.friends) },
            through: :sent_requests, source: :receiver
  has_many :pending_requests, -> { merge(Friendship.not_friends) }, 
            through: :sent_requests, source: :receiver

  has_many :notifications

  has_many :posts

  has_many :comments

  has_many :likes, dependent: :destroy
end
