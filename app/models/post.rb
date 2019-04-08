class Post < ApplicationRecord
  belongs_to :user

  has_many :answers, foreign_key: "post_id", :dependent => :destroy
  has_many :users, primary_key: "user_id", foreign_key: "id"

  default_scope -> {
    order(created_at: :desc)
  }
end
