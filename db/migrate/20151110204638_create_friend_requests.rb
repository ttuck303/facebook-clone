class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
      t.integer :requestor_id
      t.integer :requestee_id

      t.timestamps null: false
    end
    add_index :friend_requests, :requestor_id
    add_index :friend_requests, :requestee_id
    add_index :friend_requests, [:requestor_id, :requestee_id], unique: true
  end
end
