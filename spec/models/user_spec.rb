require 'spec_helper'

describe User do
  describe "validation" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:uid) }
    it { should validate_presence_of(:provider) }
    it { should validate_inclusion_of(:provider).on(User::PROVIDERS) }
    it { should validate_uniqueness_of(:uid).scoped_to(:provider) }
  end
  
  describe "#set_location" do
    it "return long/lat/manitude array per year" do
      user = FactoryGirl.create(:user)
      photo = FactoryGirl.create(:photo, user: user)
      photo = FactoryGirl.create(:photo, user: user)
      
      user.format_globe_data["2013"].last.should == 0.2
    end
  end
end