class AddSettingsToLikes < ActiveRecord::Migration[6.0]
  def change
    remove_reference :likes, :comment
    remove_reference :likes, :user
    remove_reference :likes, :post
    add_reference :likes, :user, null: false, foreign_key: true
    add_reference :likes, :post, null: true, foreign_key: true
    add_reference :likes, :comment, null: true, foreign_key: true
  end
end
