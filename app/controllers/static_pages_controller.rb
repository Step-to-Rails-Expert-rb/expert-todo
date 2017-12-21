class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @task_items = current_user.myTask
    end
  end
end
