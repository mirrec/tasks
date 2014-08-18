class Project < ActiveRecord::Base
  belongs_to :context
  has_many :tasks
  has_many :completed_tasks,
    -> { where(completed: true) },
    class_name: 'Task'
  has_many :uncompleted_tasks,
    -> { where(completed: false) },
    class_name: 'Task'
  scope :for_today, -> { where(today: true) }
  scope :not_for_today, -> { where(today: false) }

  validates :name, presence: true
end
