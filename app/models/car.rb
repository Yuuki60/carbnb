class Car < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :new_image

  include PgSearch::Model
  pg_search_scope :search_by_name,
                  against: [:name],
                  using: {
                    tsearch: { prefix: true }
                  }
end
