class Event < ApplicationRecord
  FORMAT = %w(Remote Office)
  EVENT_TYPE = %w(Lunch Drink Coffee)
  STATUS = %w(Passed Pending Current Coming)

  has_many :user_events
  has_many :user, through: :user_events
  validates :start_date, :end_date, presence: true
  validates :format, inclusion: { in: FORMAT}
  validates :event_type, inclusion: { in: EVENT_TYPE }
  validates :status, inclusion: { in: STATUS }
end
