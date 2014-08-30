require 'spec_helper'

feature 'Managing projects' do
  scenario 'switching between today and do it later', js: true do
    project = create(:project, name: 'My Project')
    visit context_path(project)

    find("#project_#{project.id}").hover

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
end
