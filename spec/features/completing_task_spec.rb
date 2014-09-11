require 'spec_helper'

feature 'Completing task' do
  scenario 'by clicking on checkbox', js: true do
    task = create(:task, name: 'Finish me')
    sign_in_user(task.user)

    visit project_path(task.project)

    find("#task_#{task.id} input[type='checkbox']").set(true)

    within '.completed' do
      expect(page).to have_content 'Finish me'
    end
  end
end
