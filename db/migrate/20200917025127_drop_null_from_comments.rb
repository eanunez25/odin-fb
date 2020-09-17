class DropNullFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :user_id
    add_column :comments, :user_id, :integer
  end
end
