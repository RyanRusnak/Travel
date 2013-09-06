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
  
  describe "#format_globe_data" do
  end
end