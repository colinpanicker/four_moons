class CreateGroupRequests < ActiveRecord::Migration
  def change
    create_table :group_requests do |t|
      t.integer :group_id
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
