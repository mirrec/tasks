class Project < ActiveRecord::Base
  belongs_to :context
  has_one :user, through: :context
  has_many :tasks, dependent: :destroy
  has_many :completed_tasks,
    -> { where(completed: true) },
    class_name: 'Task'
  has_many :uncompleted_tasks,
    -> { where(completed: false) },
    class_name: 'Task'

  validates :name, presence: true

  default_scope { where(status: self.statuses[:active]).order(:position) }
  scope :include_all_tasks, -> { includes(:completed_tasks, :uncompleted_tasks) }

  acts_as_list scope: [:context_id, :today], add_new_at: :top

  enum status: [:active, :archived]

  def toggle_today
    toggle(:today)
    save
    fix_position
  end

  private

  def fix_position
    if today?
      move_to_bottom
    else
      move_to_top
    end
  end
end
