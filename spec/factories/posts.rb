FactoryGirl.define do
  factory :post do
    sequence(:body) { |n| "#{n}This is just a test" }
    user
  end
end
