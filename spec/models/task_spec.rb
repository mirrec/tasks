require 'spec_helper'

describe Task do
  describe '#toggle_completed' do
    let(:project) { create(:project) }

    it 'toggles completed attribute' do
      task = build(:task, completed: false)

      task.toggle_completed

      expect(task.completed).to be true
    end

    it 'moves task to top if it is completed' do
      create(:task, project: project)
      task = create(:task, completed: false, project: project)

      task.toggle_completed

      expect(Task.first).to eq task
    end

    it 'sets completed_at if task is completed' do
      task = create(:task, completed: false)
      now = Time.now
      allow(Time).to receive(:now) { now }

      task.toggle_completed

      expect(task.completed_at).to eq now
    end

    it 'nulls completed_at if task is uncompleted' do
      task = build(:task, completed_at: Time.now, completed: true)

      task.toggle_completed

      expect(task.completed_at).to be nil
    end

    it 'moves task to bottom if it is uncompleted' do
      create(:task, project: project)
      task = create(:task, completed: true, project: project)

      task.toggle_completed

      expect(Task.last).to eq task
    end
  end
end
