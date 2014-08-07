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

PROJECT_NAMES.each do |project_name|
  work.projects.create(name: project_name)
  personal.projects.create(name: project_name)
end
