require 'spec_helper'

describe ProjectsController do
  describe 'POST #reorder' do
    it 'saves new project order' do
      user = create(:user)
      allow(controller).to receive(:authenticate).and_return(true)
      allow(controller).to receive(:current_user).and_return(user)
      context = create(:context, user: user)
      project1 = create(:project, context: context)
      project2 = create(:project, context: context)
      project3 = create(:project, context: context)


      post :reorder, context_id: context.id, project: [project3.id, project1.id, project2.id]

      expect(context.projects).to eq [project3, project1, project2]
    end
  end
end
