class Project < ActiveRecord::Base
  self.table_name = 'projects'
  has_many :entries
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :name, length: {maximum: 30}
  validates :name, format: {with: /\A[a-zA-ZÑñ0-9\ ]+\z/}


  def self.iron_find(id)
    where(id: id).first
  end

  def self.clean_old
    date = Time.now.midnight - 1.week
    p = Project.where("created_at < ?", date)
    p.destroy_all
  end

  def self.last_created_proyects(number)
    order(created_at: :desc).limit(number)
  end

  def total_hours_in_month(month, year)
    from = Date.new(year, month, 1)
    to = from.end_of_month
    entries = self.entries.where(date: from..to)
    entries.to_a.sum(&:hours)
  end



end
