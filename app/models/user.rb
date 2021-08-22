class User < ApplicationRecord
  #コールバック(DBにおけるデータの一意性)
  before_save { email.downcase! }
  #name属性の存在性を検証,長さの検証
  validates :name, presence: true, length: {maximum: 50}
  #emailのフォーマット検証
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum:255}, format: { with: VALID_EMAIL_REGEX },
  uniqueness: true
  #セキュアなパスワードの実装
  has_secure_password
  #パスワードの最小文字数の設定
  validates :password, presence: true, length: { minimum: 6}

end
