FactoryGirl.define do
  factory :user do
    email Faker::Internet.unique.email
    password "password"
    password_confirmation "password"
  end
end
