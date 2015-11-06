class Category < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :posts

  validates :name, presence: true, uniqueness: true
end
