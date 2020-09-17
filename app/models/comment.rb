class Comment < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :user, optional: true
  has_many :likes, dependent: :destroy

  def formatted_date
    created_at.strftime("%l:%M%p %m-%d-%y") 
  end
end
