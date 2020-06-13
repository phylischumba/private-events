require 'rails_helper'

RSpec.describe Event, type: :model do
   
    
    describe "validations" do
        it { should validate_presence_of(:title) }
        it { should validate_presence_of(:location) }
        it { should validate_presence_of(:event_date) }
      
    end

    describe "associations" do
        it { should belong_to(:creator).class_name("User") }
        it { should have_many(:event_attendings).with_foreign_key(:attended_event_id)}
        it { should have_many(:attendees).through(:event_attendings).source(:attendee)}
    end

end