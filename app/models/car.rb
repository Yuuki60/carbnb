class Car < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :new_image
end
