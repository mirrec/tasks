module ApplicationHelper
  def context_link_name(context)
    return "#{context.name}" if context.projects_for_today.count == 0
    "#{context.name} (#{context.projects_for_today.count})"
  end

  def shallow_args(parent, child)
    child.try(:new_record?) ? [parent, child] : child
  end
end
