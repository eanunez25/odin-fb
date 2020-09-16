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

  has_many :notifications, dependent: :destroy

  has_many :posts

  has_many :comments

  has_many :likes, dependent: :destroy

  # return a string of the user's full name
  def full_name
    "#{first_name} #{last_name}"
  end

  # return all posts from this user's friends and self
  def friends_and_own_posts
    myfriends = friends
    our_posts = []
    myfriends.each do |f|
      f.posts.each do |p|
        our_posts << p
      end
    end
    posts.each do |p|
      our_posts << p
    end
    our_posts
  end

end
