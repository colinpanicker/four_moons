class AddIndexToStream < ActiveRecord::Migration
  def change
  	add_index :streams, :stream_name, unique: true
  	add_index :streams, :stream_id, unique: true
  	add_index :streams, [:stream_id, :stream_name], unique: true
  end
end
