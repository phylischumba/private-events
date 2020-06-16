require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:event_date) }
  end

  describe 'associations' do
    it { should belong_to(:creator).class_name('User') }
    it { should have_many(:event_attendings).with_foreign_key(:attended_event_id) }
    it { should have_many(:attendees).through(:event_attendings).source(:attendee) }
  end
  describe 'class methods' do
    before(:example) do
      FactoryBot.create(:user)
      @event1 = FactoryBot.create(:event)
      @event2 = FactoryBot.create(:event, title: 'event2', event_date: Date.new(2020, 12, 3))
    end
    describe '::events' do
      it 'should return all events in future' do
        expect(Event.upcoming).to include(@event2)
        expect(Event.upcoming).to_not include(@event1)
      end

      it 'should return all the events in the past' do
        expect(Event.previous).to include(@event1)
        expect(Event.previous).to_not include(@event2)
      end
    end
  end
end
