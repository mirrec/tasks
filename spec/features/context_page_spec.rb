require 'spec_helper'

feature 'Context page' do
  let(:user) { sign_in_user }

  scenario 'shows link to other contexts' do
    work_context = FactoryGirl.create(:context, name: 'Work', user: user)
    personal_context = FactoryGirl.create(:context, name: 'Personal', user: user)

    visit context_path(work_context)

    expect(page).to have_link 'Work', href: context_path(work_context)
    expect(page).to have_link 'Personal', href: context_path(personal_context)
  end

  scenario 'shows projects' do
    project = FactoryGirl.create(:project, name: 'My Project', user: user)

    visit context_path(project.context)

    expect(page).to have_content 'My Project'
  end

  scenario 'menu shows count of projects for today' do
    context = create(:context, name: 'My Context', user: user)
    create(:project_for_today, context: context)

    visit root_path

    expect(page).to have_content 'My Context (1)'
  end
end
