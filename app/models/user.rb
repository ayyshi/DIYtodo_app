class User < ActiveRecord::Base
  has_secure_password

  has_and_belongs_to_many :categories
  has_many :posts

  validates :username, presence: true, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence:true, length: {in: 6..20}
end
