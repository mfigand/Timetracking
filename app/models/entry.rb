class Entry < ActiveRecord::Base
  belongs_to :project

  validates :hours, :minutes, :date, presence: true
  validates :hours, :minutes, numericality: true
  validates :project_id, presence: true

end
