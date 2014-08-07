FactoryGirl.define do
  factory :context do
    name 'My Context'
  end

  factory :project do
    context
  end
end
