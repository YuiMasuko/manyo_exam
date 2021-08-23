FactoryBot.define do
  factory :label do
    sequence(:name) { |n| "ラベル#{n + 1}"}
  end
end
