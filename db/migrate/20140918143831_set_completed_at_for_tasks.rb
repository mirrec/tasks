class SetCompletedAtForTasks < ActiveRecord::Migration
  def up
    Task.all.each do |task|
      task.update(completed_at: Time.now)
    end
  end
end
