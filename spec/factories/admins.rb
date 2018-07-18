FactoryBot.define do
  factory :admin do
    email
    password '123456'
    password_confirmation { password }
  end
end
