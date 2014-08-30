module ProjectsHelper
  def today_button_text(project)
    if project.today?
      'Do it later'
    else
      'Do it today'
    end
  end
end
