class AddBodyColumnToComment < ActiveRecord::Migration
  def change
    add_column :comments, :body, :text
  end
end
