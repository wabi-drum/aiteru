class Plan < ApplicationRecord

  belongs_to :user 
  has_many :schedules, dependent: :destroy

  validates :title, presence: true
  validates :starting_date, presence: true
  validates :ending_date, presence: true

  validates :title, length: { maximum: 80 }
  validates :place, length: { maximum: 100 }, allow_blank: true
  validates :detail, length: { maximum: 1000 }, allow_blank: true

  validate :ending_on_or_after_starting

  validate :period_not_too_long, if: -> {starting_date.present? && ending_date.present? }


  private

  def ending_on_or_after_starting
    return if starting_date.blank? || ending_date.blank?
    if ending_date < starting_date
      errors.add(:ending_date, "must be on or after Start date")
    end
  end

  def period_not_too_long
    if (ending_date - starting_date).to_i > 35
      errors.add(:ending_date, "range is too long (max 35 days)")
    end
  end
end
