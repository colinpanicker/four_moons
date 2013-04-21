class CreateUserChats < ActiveRecord::Migration
  def change
    create_table :user_chats do |t|
      t.integer :chat_id
      t.integer :user_id
      t.string :file

      t.timestamps
    end
  end
end
