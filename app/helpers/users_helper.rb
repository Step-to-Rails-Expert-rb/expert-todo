module UsersHelper
  def login_or_logout_link(current_user)
    if current_user
      link_to t("header.logout"), destroy_user_session_path, method: "DELETE"
    else
      link_to t("header.login"), new_user_session_path
    end
  end
end
