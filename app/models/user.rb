class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :first_name, :last_name, :job_title, :department, presence: true
  has_many :user_events
  has_many :events, through: :user_events
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
