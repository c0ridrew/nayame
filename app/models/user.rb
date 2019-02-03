class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  mount_uploader :image, ImageUploader
  has_many :posts, foreign_key: "user_id", class_name: "Post"
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        name: auth.info.nickname,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
