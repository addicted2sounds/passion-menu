FactoryBot.define do
  factory :user do
    uid { "MyString" }
    email { Faker::Internet.email }
    name { Faker::FunnyName.name }
  end
end
