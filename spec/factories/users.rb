FactoryBot.define do
  factory :user do
    nickname               {Faker::Name.name}
    email                  {Faker::Internet.free_email}
    password               {Faker::Internet.password(min_length: 6)}
    password_confirmation  {password}
    gimei = Gimei.name
    lastname               {gimei.last}
    firstname              {gimei.first}
    lastname_kana          {gimei.last.katakana}
    firstname_kana         {gimei.first.katakana}
    birthday               {Faker::Date.birthday}
  end
end
