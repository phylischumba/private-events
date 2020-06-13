class Event < ApplicationRecord
  validates :title, presence: true
  validates :location, presence: true
  validates :event_date, presence: true

  belongs_to :creator, class_name: 'User'
  has_many :event_attendings, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :event_attendings, source: :attendee

  scope :upcoming_scope, -> { where('event_date >= ?', DateTime.now.to_date) }
  scope :previous_scope, -> { where('event_date < ?', DateTime.now.to_date) }

  def self.upcoming
    Event.upcoming_scope
  end

  def self.previous
    Event.previous_scope
  end
end
