class User < ApplicationRecord
  has_many :cars
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :lockable, :confirmable, :timeoutable
end
