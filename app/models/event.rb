class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events
  validates :start_date, :end_date, presence: true
  validates :format, inclusion: { in: %w(Remote Office) }
  validates :event_type, inclusion: { in: %w(Lunch Drink Coffee) }
  validates :status, inclusion: { in: %w(Passed Pending Current Coming) }
end
