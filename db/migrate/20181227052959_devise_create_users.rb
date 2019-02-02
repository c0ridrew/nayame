class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table(:users) do |t|
      t.string :name,               null:false, default: "", index: true
      t.integer :status,             null:false, default: 0
      t.string :email,              null: false, default: "", unique: true, index: true
      t.string :encrypted_password, null: false, default: ""
      t.string :uid
      t.string :provider
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.timestamps
    end
  end
end