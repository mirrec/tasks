class Task < ActiveRecord::Base
  belongs_to :project
  has_one :context, through: :project
  has_one :user, through: :context

  acts_as_list scope: :project

  validates :name, presence: true

  default_scope { order(:position) }

  def toggle_completed
    toggle(:completed)
    if completed?
      move_to_top
      self.completed_at = Time.now
    else
      move_to_bottom
      self.completed_at = nil
    end
    self
  end
end
