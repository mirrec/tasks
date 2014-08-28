require 'spec_helper'

feature 'Deleting tasks' do
  scenario 'deletes task', js: true do
    task = create(:task, name: 'Delete me')
    visit context_path(task.context)

    within "#task_#{task.id}" do
      click_link 'Delete'
    end

    expect(page).not_to have_content(task.name)
  end
end
