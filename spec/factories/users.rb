FactoryBot.define do
  factory :user do
    username { 'Dan' }
    email { 'ada@gmail.com' }
    password_digest { BCrypt::Password.create('MyString09876') }
    role { 0 }
  end
end
