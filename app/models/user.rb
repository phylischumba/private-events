class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :event_attendings, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :event_attendings, source: :attended_event
end
