class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :stream_id
      t.integer :user_id
      t.string :content

      t.timestamps
    end
  end
end
