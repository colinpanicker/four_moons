class CreateStreamUsers < ActiveRecord::Migration
  def change
    create_table :stream_users do |t|
      t.integer :user_id
      t.integer :stream_id

      t.timestamps
    end
  end
end
