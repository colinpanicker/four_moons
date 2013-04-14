class CreateUserFiles < ActiveRecord::Migration
  def change
    create_table :user_files do |t|
      t.integer :user_id
      t.string :file_name
      t.string :file

      t.timestamps
    end
  end
end
