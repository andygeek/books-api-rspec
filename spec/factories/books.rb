FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    year { rand(1950..2021) }
    author
    genre
  end
end