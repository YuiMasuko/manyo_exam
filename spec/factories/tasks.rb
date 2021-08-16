FactoryBot.define do
  factory :task do
    title {'test_title'}
    content {'test_content'}
    expired_at {'2021-08-12 00:00:00'}
    status {'未着手'}
    priority {'低'}
    association :user, user: :basic_user
  end
  factory :second_task, class: Task do
    title {'test2_title'}
    content {'test2_content'}
    expired_at {'2021-08-30 00:00:00'}
    status {'着手中'}
    priority {'低'}
    association :user, user: :basic_user
  end
end
