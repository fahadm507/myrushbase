FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "#{n}@example.com" }
    first_name "Fahad"
    last_name "Mukunzi"
    password "testing2020"
    password_confirmation "testing2020"
  end
end
