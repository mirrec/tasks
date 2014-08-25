require 'spec_helper'

describe Task do
  describe '#toggle_and_fix_position' do
    it 'toggles completed attribute' do
      task = build(:task, completed: false)

      task.toggle_and_fix_position

      expect(task.completed).to be true
    end

    it 'moves task to top if it is completed' do
      project = create(:project)
      create(:task, project: project)
      task = create(:task, completed: false, project: project)

      task.toggle_and_fix_position

      expect(Task.first).to eq task
    end

    it 'moves task to bottom if it is uncompleted' do
      project = create(:project)
      create(:task, project: project)
      task = create(:task, completed: true, project: project)

      task.toggle_and_fix_position

      expect(Task.last).to eq task
    end
  end
end
