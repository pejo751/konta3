class AddFotoColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :foto_file_name,    :string
    add_column :users, :foto_content_type, :string
    add_column :users, :foto_file_size,    :integer
    add_column :users, :foto_updated_at,   :datetime
  end
end
