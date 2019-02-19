class Post < ApplicationRecord
  belongs_to :user

  has_many :answers, foreign_key: "post_id", :dependent => :destroy, class_name: "Answer"
  has_many :users, foreign_key: "user_id", class_name: "Post"
end
