FactoryBot.define do
  sequence :email do |n|
    "test#{n}@test.com"
  end

  factory :user do
    email { "test@test.com" }
    name { "MyString" }
    password { "MyString" }
  end

  factory :admin do
    email { "test@test.com" }
    name { "MyString" }
    password { "MyString" }
    type { "Admin" }
  end
end
