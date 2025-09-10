class Schedule < ApplicationRecord

  belongs_to :user
  belongs_to :plan

  enum status: { unavailable: 0, available: 1, maybe: 2 }

  validates :date_time, presence: true
  validates :status, presence: true 
end
