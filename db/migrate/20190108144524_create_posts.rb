class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id, index: true
      t.string :content
      t.binary :image
      t.timestamps
    end
  end
end
