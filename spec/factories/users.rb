FactoryBot.define do
  factory :user do
    username { "MyString" }
    email { "ada@gmail.com" }
    password_digest { "MyString" }
    role{0}
  end
end
