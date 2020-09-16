class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :likes, dependent: :destroy

  def formatted_date
    created_at.strftime("%l:%M%p %m-%d-%y") 
  end
end
