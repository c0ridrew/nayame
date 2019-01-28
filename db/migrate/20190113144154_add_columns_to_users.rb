class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image, :binary, :limit => 5.megabyte
    add_column :users, :profile, :text
    add_column :users, :report, :integer
  end
end
