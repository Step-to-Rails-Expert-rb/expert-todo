module TasksHelper
  def options_for_priority
    [["",""]] +
    I18n.t("activerecord.attributes.task.priority_enum").map{|k,v| [v,k]}
  end
  def options_for_status
    [["",""]] +
    I18n.t("activerecord.attributes.task.status_enum").map{|k,v| [v,k]}
  end
  def label_priority(num)
    I18n.t("activerecord.attributes.task.priority_enum")[num]
  end
  def label_status(num)
    I18n.t("activerecord.attributes.task.status_enum")[num]
  end
end
