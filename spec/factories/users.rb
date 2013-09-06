FactoryGirl.define do
  factory :user do
    name Forgery(:name).full_name
    email Forgery(:internet).email_address
    uid Forgery(:basic).encrypt
    provider 'twitter'
  end
end
