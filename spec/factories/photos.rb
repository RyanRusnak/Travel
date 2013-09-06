include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :photo do
    association :user
    name Forgery(:name).location
    image { fixture_file_upload("spec/sample/gps_image.jpg", "image/jpeg") }
  end
end
