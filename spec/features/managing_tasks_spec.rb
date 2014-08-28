require 'spec_helper'

feature 'Managing tasks' do
  scenario 'user creates task', js: true do
    project = create(:project)

    visit project_path(project)

    fill_in :task_name, with: 'New Task'
    click_button 'Create Task'

    expect(page).to have_content 'New Task'
  end

  scenario 'user edits task', js: true do
    task = create(:task, name: 'Edit me')
    visit context_path(task.context)

    within "#task_#{task.id}" do
      click_link 'Edit'
      fill_in :task_name, with: 'I am edited'
      click_button 'Save'
    end

    expect(page).to have_content 'I am edited'
  end

  scenario 'user deletes task', js: true do
    task = create(:task, name: 'Delete me')
    visit context_path(task.context)

    within "#task_#{task.id}" do
      click_link 'Delete'
    end

    expect(page).not_to have_content(task.name)
  end
end
