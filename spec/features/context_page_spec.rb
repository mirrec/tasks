require 'spec_helper'

feature 'Context page' do
  scenario 'it shows link to other contexts' do
    work_context = FactoryGirl.create(:context, name: 'Work')
    personal_context = FactoryGirl.create(:context, name: 'Personal')

    visit context_path(work_context)

    expect(page).to have_link 'Work', href: context_path(work_context)
    expect(page).to have_link 'Personal', href: context_path(personal_context)
  end
end
