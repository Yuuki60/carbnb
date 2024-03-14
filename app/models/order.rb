class Order < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validates :car_id, presence: true
  validates :user_id, presence: true
  validates :state, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def state_label
    case state
    when 0
      "Pending"
    when 1
      "Accepted"
    when 2
      "Declined"
    when 3
      "Cancelled"
    end
  end

end
