FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(mix_case: true)}
    password_confirmation {password}
    last_name             {"野田"}
    first_name            {"武雄"}
    last_name_reading     {"ノダ"}
    first_name_reading    {"タケオ"}
    birthday              {"1996-09-26"}
  end
end