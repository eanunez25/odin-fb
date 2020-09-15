class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :requestor_id
      t.integer :receiver_id
      t.boolean :status

      t.timestamps
    end
  end
end
