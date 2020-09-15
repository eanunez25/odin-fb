class ChangeFriendshipColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :friendships, :friend_a_id
    remove_column :friendships, :friend_b_id

    add_column :friendships, :user_id, :integer
    add_column :friendships, :friend_id, :integer
  end
end
