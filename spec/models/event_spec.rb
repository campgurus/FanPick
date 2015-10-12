require 'rails_helper'

RSpec.describe Event, type: :model do
  it "is invalid if it doesn't have a unique api event_id" do
    FactoryGirl.create(:event)
    event2 = FactoryGirl.build(:event)
    expect(event2).to be_invalid
  end
  it "is valid with a unique api event_id" do
  	FactoryGirl.create(:event)
    event2 = FactoryGirl.build(:event, event_id: 2)
    expect(event2).to be_valid
  end
end
