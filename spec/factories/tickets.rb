FactoryBot.define do
  factory :ticket do
    client { association :user }
    title { Faker::Quote.matz }
    description { Faker::Lorem.sentence(word_count: 10) }
    category { :computer }
    status { :open }
  end
end
