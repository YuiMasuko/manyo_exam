FactoryBot.define do
  factory :admin_user, class: User do
    name {'admin_name'}
    email {'admin_email@gmail.com'}
    password {'adminuser'}
    password_confirmation {'adminuser'}
    admin {true}
  end
  factory :basic_user, class: User do
    name {'basic_name'}
    email {'basic_email@gmail.com'}
    password {'basicuser'}
    password_confirmation {'basicuser'}
    admin {false}
  end
end
