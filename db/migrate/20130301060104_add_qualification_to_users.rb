class AddQualificationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :qualification, :string
  end
end
