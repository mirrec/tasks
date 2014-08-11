require 'spec_helper'

feature 'Creating new task' do
  scenario 'on project page' do
    project = create(:project)

    visit project_path(project)

    fill_in :task_name, with: 'New Task'
    click_button 'Create Task'

    expect(page).to have_content 'New Task'
  end
end
