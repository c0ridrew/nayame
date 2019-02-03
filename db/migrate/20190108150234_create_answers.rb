class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :post_id, index: true
      t.integer :user_id, index: true
      t.string :content
      t.timestamps
    end
  end
end
