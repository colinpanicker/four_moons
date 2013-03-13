class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.integer :stream_id
      t.string :stream_name

      t.timestamps
    end
  end
end
