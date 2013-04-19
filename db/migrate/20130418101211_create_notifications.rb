class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.string :content
      t.string :content_type

      t.timestamps
    end
  end
end
