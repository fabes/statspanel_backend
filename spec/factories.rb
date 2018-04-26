FactoryBot.define do
  factory :panel do
    project nil
  end
  factory :project do
    name 'Test Project'
    code SecureRandom.hex(3)
    status 1
  end
  factory :user do
    first_name "User"
    last_name  "One"
    email "johndoe@localhost.com"
    password "pass1234"
  end
end