FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "#{n}@example.com" }
    sequence(:first_name) { |n| "#{n}Fahad"}
    sequence(:last_name) { |n| "#{n}Mukunzi" }
    password "testing2020"
    password_confirmation "testing2020"
  end
end
