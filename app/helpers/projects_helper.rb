module ProjectsHelper

  def project_hours_for_month(project, date)
    project.total_hours_in_month(date.month,date.year)
  end
end
