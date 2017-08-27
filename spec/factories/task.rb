FactoryGirl.define do
  factory :task do
    user
    sequence(:task_name) { |n| "資料の作成_#{n}"}
    
    trait :description do
      description "〜社との打ち合わせの資料作成"
    end
    
    trait :due_date do
      due_date { DateTime.now }
    end
  end
end
