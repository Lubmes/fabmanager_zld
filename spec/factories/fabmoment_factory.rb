FactoryGirl.define do
  factory :fabmoment do
    title "This is Fabmoment ABC"
    description "An example fabmoment, nothing more"
  end

  trait :admin do
    admin true
  end
end