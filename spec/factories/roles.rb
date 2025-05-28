FactoryBot.define do
  factory :role do
    name { "Administrator" }
    code { "ADM" }

    trait :client do
      name { "Client" }
      code { "CLT" }
    end
  end
end
