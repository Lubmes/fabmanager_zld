FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "test#{n}_user" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password "password"

    trait :admin do
      admin true
    end
  end
end
