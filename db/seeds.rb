Context.delete_all
Project.delete_all

work = Context.create(name: 'Work')
personal = Context.create(name: 'Personal')

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
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam porttitor feugiat elit. Maecenas cursus enim non sapien dapibus posuere.'
    )
    project.update(today: true) if index == 0
  end
end

Project.all.each do |project|
  5.times do |n|
    project.tasks.create(name: "Task number #{n}")
  end
end
