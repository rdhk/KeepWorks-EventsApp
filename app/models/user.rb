class User < ActiveRecord::Base
  has_secure_password

  enum gender: {male: 0, female: 1}

  validates :name, :email,:password, :gender, presence: true
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email, format: { with: REGEX[:email] }, allow_blank: true
  validates :email, uniqueness: true, case_sensitive: false

  has_many :tickets
  has_many :events, through: :tickets

  scope :all_except, ->(user) { where.not(id: user) }

  def attends? event
    events.any?{|e| e == event}
  end
end
