User.destroy_all
Context.destroy_all
Project.destroy_all
Task.destroy_all

user = User.create(email: 'user@example.com', password: 'password')
work = Context.create(name: 'Work', user: user)
personal = Context.create(name: 'Personal', user: user)

PROJECT_NAMES = [
  'Build successfull company',
  'Buy new car',
  'Create some awesome task application',
  'Earn first milion',
  'Finish your 10th Marathon'
]

PROJECT_NAMES.each_with_index do |project_name, index|
  [work, personal].each do |context|
    project = context.projects.create(
      name: project_name,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam porttitor feugiat elit. Maecenas cursus enim non sapien dapibus posuere.',
      context: context
    )
    project.update(today: true) if index == 0
  end
end

Project.all.each do |project|
  10.times do |n|
    project.tasks.create(name: "Task number #{n}")
  end
end
