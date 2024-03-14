class Car < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_one_attached :new_image
end
