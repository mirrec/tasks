FactoryGirl.define do
  factory :context do
    name 'My Context'
    user
  end

  factory :project do
    context
    name 'My Project'
  end

  factory :task do
    name 'New Task'
    project
  end

  factory :user do
    sequence :email do |n|
      "user-#{n}@example.com"
    end
    password 'password'
  end
end
