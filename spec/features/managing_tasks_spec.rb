require 'spec_helper'

feature 'Managing tasks' do
  let(:project) { create(:project, user: user) }
  let(:user) { sign_in_user }

  scenario 'user creates task', js: true do
    visit project_path(project)

    find("#project_#{project.id}").hover
    click_link 'Add new task'

    fill_in :task_name, with: 'New Task'
    click_button 'Save'

    expect(page).to have_content 'New Task'
  end

  scenario 'user edits task', js: true do
    task = create(:task, name: 'Edit me', project: project)
    visit context_path(task.context)

    find("#task_#{task.id}").hover

    within "#task_#{task.id}" do
      click_link 'Edit'
      fill_in :task_name, with: 'I am edited'
      click_button 'Save'
    end

    expect(page).to have_content 'I am edited'
  end

  scenario 'user deletes task', js: true do
    task = create(:task, name: 'Delete me', project: project)
    visit context_path(task.context)

    find("#task_#{task.id}").hover

    within "#task_#{task.id}" do
      click_link 'Delete'
    end

    expect(page).not_to have_content(task.name)
  end
end
