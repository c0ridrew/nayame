class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :post, index: true
      t.references :user, index: true
      t.string :content
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end
