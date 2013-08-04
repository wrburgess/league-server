module ApplicationHelper

  def flash_class(level)
    case level
      when :notice then "info"
      when :error then "error"
      when :alert then "warning"
    end
  end

  def commish_flag(log)
    log.group_owner ? "commish-action" : ""
  end

end
