 class Event < ApplicationRecord
  FORMAT = %w(Remote Office)
  EVENT_TYPE = %w(Lunch Drink Coffee)

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :user_events
  has_many :users, through: :user_events
  validates :start_date, :end_date, presence: true
  validates :format, inclusion: { in: FORMAT}
  validates :event_type, inclusion: { in: EVENT_TYPE }

  attr_accessor :venue_rankings

  def cancel
    self.cancel = true
    self.save
  end

  def self.to_be_paired(user)
    Event.all.filter { |e| e.users.length == 1 && e.other_user(user) }
  end

  def status(user)
    event = self
    if event.canceled == true
      status = "canceled"
    else
      if event.end_date < Time.now
        status = "passed"
      elsif event.other_user(user)
        status = "pairing"
      elsif event.end_date < (Time.now + (60 * 60 * 2))
        status = "now"
      else
        status = "paired"
      end
    end
  end

  def other_user(user)
    return self.users.where.not(id: user.id).empty?
  end

  def current_user_events(user)
    user.events
  end



end
