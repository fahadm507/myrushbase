FactoryGirl.define do
  factory :comment do
    sequence(:description) { |n| "#{n}I do like this comment" }

    post
    user
  end
end
