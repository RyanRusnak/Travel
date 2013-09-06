require 'spec_helper'

describe Photo do
  describe "association" do
    it { should belong_to(:user) }
  end
  
  describe "validation" do
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:user) }
  end
  
  describe "#set_location" do
    it "return long/lat/manitude array per year" do
      user = FactoryGirl.create(:user)
      photo = FactoryGirl.create(:photo, user: user)
      photo = FactoryGirl.create(:photo, user: user)
      
      user.format_globe_data["2013"].count.should == 2
    end
  end
end