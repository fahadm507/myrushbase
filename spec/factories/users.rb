FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "#{n}@example.com" }
    first_name "Fahad"
    last_name "Mukunzi"
    password "testing123"
    password_confirmation "testing123"
  end
end
