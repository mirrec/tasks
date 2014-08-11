require 'spec_helper'


feature 'Completing task' do
  scenario 'by clicking on checkbox', js: true do
    task = create(:task, name: 'Finish me')

    visit project_path(task.project)

    check :task_completed

    within '.completed-tasks' do
      expect(page).to have_content 'Finish me'
    end
  end
end
