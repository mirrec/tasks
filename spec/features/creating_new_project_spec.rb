require 'spec_helper'

feature 'Managing projects' do
  let(:user) { sign_in_user }

  scenario 'creating new project' do
    context = create(:context, user: user)

    visit context_path(context)

    click_link 'New Project'

    fill_in 'Name', with: 'My Project'
    fill_in 'Description', with: 'My description'
    click_button 'Create Project'

    expect(page).to have_content 'My Project'
    expect(page).to have_content 'My description'
  end

  scenario 'editing project' do
    project = create(:project, name: 'My Project', user: user)
    new_context = create(:context, name: 'New Context', user: user)

    visit project_path(project)
    click_button 'More'
    click_link 'Edit'

    fill_in 'Name', with: 'Your Project'
    select 'New Context', from: 'Context'
    click_button 'Update Project'

    expect(page).to have_content 'Your Project'
    project.reload
    expect(project.context).to eq new_context
  end
end
