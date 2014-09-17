require 'spec_helper'

describe Project do
  describe '#fix_position' do
    let(:context) { create(:context) }

    it 'moves task to the top if it is not for today' do
      create(:project, today: false, context: context)
      project = create(:project, today: false, context: context)

      project.fix_position

      expect(project.position).to be 1
    end

    it 'moves task to the bottom if it is for today' do
      project = create(:project, today: true, context: context)
      create(:project, today: true, context: context)

      project.fix_position

      expect(project.position).to be 2
    end
  end
end
