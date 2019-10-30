FactoryBot.define do
  factory :course do
    name { Faker::Job.title }
    author { Faker::FunnyName.name }
    category
    state { 'active' }
  end
end
