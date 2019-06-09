FactoryBot.define do
  factory :book do
    parent_id { 1 }
    title { "MyString" }
    info { "MyText" }
  end
end
