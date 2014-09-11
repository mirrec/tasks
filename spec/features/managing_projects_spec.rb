require 'spec_helper'

feature 'Managing projects' do
  let(:project)  { create(:project, name: 'My Project', user: user) }
  let(:user) { sign_in_user }

  before do
    visit context_path(project)
    find("#project_#{project.id}").hover
  end

  scenario 'switching between today and do it later', js: true do
    within "#project_#{project.id}" do
      click_link 'Do it today'
    end

    within '.today' do
      expect(page).to have_content 'My Project'
    end

    find("#project_#{project.id}").hover

    within "#project_#{project.id}" do
      click_link 'Do it later'
    end

    within '.today' do
      expect(page).not_to have_content 'My Project'
    end
  end

  scenario 'deleting project', js: true do
    within "#project_#{project.id}" do
      click_button 'More'
      click_link 'Delete'
    end

    expect(page).not_to have_content 'My Project'
  end

  scenario 'archiving project', js: true do
    within "#project_#{project.id}" do
      click_button 'More'
      click_link 'Archive'
    end

    expect(page).not_to have_content 'My Project'
  end
end
