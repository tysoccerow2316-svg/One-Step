FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.unique.email }
    password              { '123456' }
    password_confirmation { password }
    long_term_goal                { 'エンジニアになって、人々の生活を豊かにする' } 
  end
end