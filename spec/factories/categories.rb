FactoryBot.define do
  factory :category do
    name { Faker::Science.element }
    vertical
    state { 'active' }
  end
end
