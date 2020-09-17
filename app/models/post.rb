class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def formatted_date
    created_at.strftime("%l:%M%p %m-%d-%y") 
  end


end
