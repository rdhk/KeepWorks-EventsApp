class User < ActiveRecord::Base
  has_secure_password

  validates :name, :email,:password, :gender, presence: true
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email, format: { with: REGEX[:email] }, allow_blank: true
  validates :email, uniqueness: true, case_sensitive: false


  enum gender: {male: 0, female: 1}

end
