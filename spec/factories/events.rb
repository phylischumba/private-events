FactoryBot.define do
  factory :event do
    title { 'event1' }
    location { 'Location1' }
    event_date { Date.new(2010, 5, 7) }
    creator { User.first }
  end
end
