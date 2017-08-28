module ApplicationHelper
  def is_bool?(value)
    !!value === value
  end
  def nl2br(str)
    if str.present?
      sanitize(str).gsub("\n", '<br>').html_safe
    else
      ''
    end
  end
end
