class AddStreamTableNameToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :stream_table_name, :string
  end
end
