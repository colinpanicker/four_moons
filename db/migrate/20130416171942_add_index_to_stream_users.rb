class AddIndexToStreamUsers < ActiveRecord::Migration
  def change
  	add_index :stream_users, :user_id
    add_index :stream_users, :stream_id
    add_index :stream_users, [:user_id, :stream_id], unique: true

  end
end
