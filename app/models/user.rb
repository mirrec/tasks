class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :contexts, dependent: :destroy
  has_many :projects, through: :contexts
  has_many :tasks, through: :projects

  has_secure_password
  validates :email, uniqueness: true, presence: true, format: { with: VALID_EMAIL_REGEX }
end
