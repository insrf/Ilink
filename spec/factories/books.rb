FactoryBot.define do
  sequence :title do |n|
    "MyString#{n}"
  end

  factory :book do
    parent_id { '' }
    title { "MyString" }
    info { "MyText" }
  end

  factory :generate_book, class: "Book" do
    parent_id { '' }
    title { generate(:title) }
    info { "MyTextInfo" }
  end
end
