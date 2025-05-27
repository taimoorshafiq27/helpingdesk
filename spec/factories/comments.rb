FactoryBot.define do
  factory :comment do
    body { "MyString" }
    ticket { nil }
  end
end
