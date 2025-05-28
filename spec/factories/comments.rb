FactoryBot.define do
  factory :comment do
    user { association :user }
    ticket { association :ticket }
    body { Faker::Marketing }
  end
end
