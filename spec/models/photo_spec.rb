require 'spec_helper'

describe Photo do
  describe "association" do
    it { should belong_to(:user) }
    it { should belong_to(:location) }
  end
  
  describe "validation" do
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:user) }
  end
  
  describe "#set_location" do
    it "create location record from image exif data" do
      photo = FactoryGirl.create(:photo)
      
      photo.location.address.should == "1551 South Kinney Road, Tucson, AZ 85713, USA"
    end
  end
end