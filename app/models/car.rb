class Car < ApplicationRecord
  geocoded_by :location
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_one_attached :new_image
  after_validation :geocode, if: :will_save_change_to_location?
end
