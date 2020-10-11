FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {password}
    family_name           {"田中"}
    first_name            {"一郎"}
    family_kana           {"タナカ"}
    first_kana            {"イチロウ"}
    birth_day             {"1935-07-07"}
  end
end