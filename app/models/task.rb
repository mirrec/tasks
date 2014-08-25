class Task < ActiveRecord::Base
  belongs_to :project

  acts_as_list scope: :project

  validates :name, presence: true

  default_scope { order(:position) }

  def toggle_and_fix_position
    toggle(:completed)
    if completed?
      move_to_top
    else
      move_to_bottom
    end
    self
  end
end
