module ApplicationHelper
  def context_link_name(context)
    return "#{context.name}" if context.projects.for_today.count == 0
    "#{context.name} (#{context.projects.for_today.count})"
  end
end
