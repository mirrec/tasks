FactoryGirl.define do
  factory :context do
    name 'My Context'
  end

  factory :project do
    context
    name 'My Project'
  end

  factory :task do
    name 'New Task'
    project
  end
end
