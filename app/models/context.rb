class Context < ActiveRecord::Base
  belongs_to :user
  has_many :projects, dependent: :destroy
  has_many :projects_for_today,
    -> { where(today: true) },
    class_name: 'Project'
  has_many :projects_for_later,
    -> { where(today: false) },
    class_name: 'Project'

  validates :name, presence: true
end
