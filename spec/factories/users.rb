FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name[0..30] }
    last_name { Faker::Name.last_name[0..30] }
    email { "example@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end