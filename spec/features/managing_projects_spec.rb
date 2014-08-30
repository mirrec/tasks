require 'spec_helper'

feature 'Managing projects' do
  scenario 'switching between today and do it later' do
    project = create(:project, name: 'My Project')
    visit context_path(project)

    within "#project_#{project.id}" do
      click_button 'Do it today'
    end

    within '.today' do
      expect(page).to have_content 'My Project'
    end

    within "#project_#{project.id}" do
      click_button 'Do it later'
    end

    within '.today' do
      expect(page).not_to have_content 'My Project'
    end
  end
end
