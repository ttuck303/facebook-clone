class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
      t.integer :requestor_id
      t.integer :requestee_id

      t.timestamps null: false
    end
  end
end
