require 'spec_helper'

describe Project do
  describe '#toggle_today' do
    let(:context) { create(:context) }

    it "toggles today's value" do
      project = build(:project, today: false)

      project.toggle_today

      expect(project.today).to be true
    end

    it 'moves task to the top if it is not for today' do
      create(:project, today: false, context: context)
      project = create(:project, today: true, context: context)

      project.toggle_today

      expect(project.position).to be 1
    end

    it 'moves task to the bottom if it is for today' do
      project = create(:project, today: false, context: context)
      create(:project, today: true, context: context)

      project.toggle_today

      expect(project.position).to be 2
    end
  end
end
