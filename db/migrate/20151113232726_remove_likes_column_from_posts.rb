class RemoveLikesColumnFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :likes
  end
end
