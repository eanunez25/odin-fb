class AddRefToComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :user_id
    add_reference :comments, :user, foriegn_key: true
  end
end
