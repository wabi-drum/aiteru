class Schedule < ApplicationRecord

  belongs_to :user
  belongs_to :plan

  enum status: { unavailable: 0, available: 1, maybe: 2 }

  validates :date_time, presence: true
  validates :status, presence: true 
  validate :date_within_plan_period

  private

  def date_within_plan_period
    return if date_time.blank?

    if date_time.to_date < plan.starting_date || date_time.to_date > plan.ending_date
      error.add(:date_time, "Must be within the plan period.")
    end
  end
end
