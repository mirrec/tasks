require 'spec_helper'

feature 'Completing task' do
  scenario 'by clicking on checkbox', js: true do
    project = create(:project, show_completed_tasks: false)
    task = create(:task, name: 'Finish me', project: project)
    sign_in_user(task.user)

    visit project_path(project)

    find("#task_#{task.id} input[type='checkbox']").set(true)

    click_link 'Show completed'

    within '.completed' do
      expect(page).to have_content 'Finish me'
    end
  end
end
