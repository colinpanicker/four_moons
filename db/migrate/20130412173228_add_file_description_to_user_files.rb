class AddFileDescriptionToUserFiles < ActiveRecord::Migration
  def change
    add_column :user_files, :file_description, :string
  end
end
