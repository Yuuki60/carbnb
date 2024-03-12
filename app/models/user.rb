class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  has_many :cars
  has_one_attached :avatar
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
