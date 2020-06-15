require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3).is_at_most(25) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value('test@test.com').for(:email) }
    it { should_not allow_value('test@test').for(:email) }
  end

  describe 'associations' do
    it { should have_many(:created_events).class_name('Event').with_foreign_key(:creator_id) }
    it { should have_many(:event_attendings).with_foreign_key(:attendee_id) }
    it { should have_many(:attended_events).through(:event_attendings).source(:attended_event) }
  end
end
