module TaskDecorator
  def due_date_without_time
    due_date.nil? ? nil : due_date.strftime("%Y-%m-%d")
  end
end
