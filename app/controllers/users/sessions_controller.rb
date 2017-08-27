class Users::SessionsController < Devise::SessionsController
  def new
    super
  end
  
  def create
    super
  end
  
  def destroy
    super
  end

  def after_sign_in_path_for(resource)
    tasks_path
  end
end
