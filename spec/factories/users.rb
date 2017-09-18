FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email_#{n}@example.com" }
    password 'password'
  end
end