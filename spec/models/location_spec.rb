require 'spec_helper'

describe Location do
  describe "association" do
    
  end
  
  describe "validation" do
    it { should validate_presence_of(:coordinates) }
    it { should validate_uniqueness_of(:coordinates) }
  end
  
  describe "#geocoded?" do
    it "creates location info from google geocode api" do
      location = FactoryGirl.create(:location, coordinates: [-111.16627692998205, 32.243005600000004])
      
      location.address.should == "1551 South Kinney Road, Tucson, AZ 85713, USA"
      location.city.should == "Tucson"
      location.state.should == "Arizona"
      location.zipcode.should == "85713"
    end
  end
end