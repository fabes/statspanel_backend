FactoryBot.define do
  factory :project do
    user nil
  end
  factory :user do
    first_name "User"
    last_name  "One"
    email "johndoe@localhost.com"
    password "pass1234"
  end
end