class Car < ApplicationRecord
  geocoded_by :location
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :new_image
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_location,
                  against: [ :name, :location ],
                  using: {
                    tsearch: { prefix: true }
                  }
end
