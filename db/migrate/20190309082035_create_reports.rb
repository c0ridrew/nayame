class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :sender_id
      t.references :user, index: true

      t.timestamps
    end
  end
end
