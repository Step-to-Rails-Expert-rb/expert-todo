class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :logged_in?

  # ログインチェック
  def logged_in?
    user_id = session[:user]
    if user_id then
      begin
        @current_user = User.find(user_id)
      rescue ActiveRecord::RecordNotFound
        logout
      end
    end
    unless @current_user
      # ログインしてなければ、ログイン画面に飛ばす
      # ログイン後、リクエストされたページに戻れるようにリファラを渡しとく
      flash[:referer] = request.fullpath
      redirect_to "/login"
    end
  end

  # セッションのリセット(ログアウト)
  def reset_session
    session[:user] = nil
    @current_user = nil
  end

end
