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
  default_scope { where(status: self.statuses[:active]).order(:position) }

  validates :name, presence: true
  acts_as_list scope: :context
  enum status: [:active, :archived]

  def fix_position
    if today?
      move_to_bottom
    else
      move_to_top
    end
  end
end
