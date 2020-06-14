FactoryBot.define do
  factory :user do
    name { "Oscar Vazquez" }
    email { "oscar@gmail.com" }
    password { "helloworld" }
    password_confirmation  { "helloworld" }
  end
end
