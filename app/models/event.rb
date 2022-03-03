class Event < ApplicationRecord
  FORMAT = %w(Remote Office)
  EVENT_TYPE = %w(Lunch Drink Coffee)

  has_many :user_events
  has_many :users, through: :user_events
  validates :start_date, :end_date, presence: true
  validates :format, inclusion: { in: FORMAT}
  validates :event_type, inclusion: { in: EVENT_TYPE }

  def cancel
    self.cancel = true
    self.save
  end

  def status(user_current)
    event = self
    if event.canceled == true
      status = "canceled"
    else
      if event.end_date < Time.now
        status = "passed"
      elsif !event.other_user(user_current)
        status = "pairing"
      elsif event.end_date < (Time.now + (60 * 60 * 2))
        status = "now"
      else
        status = "paired"
      end
    end
  end

  def other_user(user_current)
    return self.users.where.not(id: user_current.id)
  end
end
