FactoryBot.define do
  factory :role do
    sequence(:name) { "Administrator" }
    sequence(:code) { "ADM" }

    trait :client do
      name { "Client" }
      code { "CLT" }
    end
  end
end
