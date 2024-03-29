class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable  
  #:recoverable, :rememberable, :validatable

  has_many :categories
  has_many :tasks, through: :categories
  
  validates :email, presence: true
  validates :password, presence: true, confirmation: true
end
