class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :requests_as_requestor, foreign_key: :requestor_id, class_name: "Request"
  has_many :requests_as_receiver, foreign_key: :receiver_id, class_name: "Request"

  has_many :friends, class_name: "User", foreign_key: :user_id
  has_many :friendships
  has_many :friends, through: :friendships

  has_many :notifications

  has_many :posts

  has_many :comments

  has_many :likes, dependent: :destroy
end
