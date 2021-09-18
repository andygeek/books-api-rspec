FactoryBot.define do
  factory :author do
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    age { rand(18..80) }
  end
end