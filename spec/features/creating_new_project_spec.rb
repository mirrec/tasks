require 'spec_helper'

feature 'Managing projects' do
  scenario 'creating new project' do
    context = create(:context)

    visit context_path(context)

    click_link 'New Project'

    fill_in 'Name', with: 'My Project'
    fill_in 'Description', with: 'My description'
    click_button 'Create Project'

    expect(page).to have_content 'My Project'
    expect(page).to have_content 'My description'
  end

  scenario 'editing project' do
    project = create(:project, name: 'My Project')

    visit project_path(project)
    click_link 'Edit Project'

    fill_in 'Name', with: 'Your Project'
    click_button 'Update Project'

    expect(page).to have_content 'Your Project'
  end
end
