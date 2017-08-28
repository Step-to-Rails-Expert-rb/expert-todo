class LoginController < ApplicationController
  # ログイン画面ではログインチェック飛ばす
  skip_before_action :logged_in?

  def index
  end

  def create
    @user = User.find_by(email: login_params[:email])
    if @user.present? && @user.authenticate(login_params[:password])
      # ログインOK
      reset_session
      session[:user] = @user.id
      redirect_to params[:referer].present? ? params[:referer] : '/', notice: 'ログインしました'
    else
      # ログインNG
      flash.now[:referer] = params[:referer]
      flash.now[:error_message] = 'ユーザー名またはパスワードが違います'
      render :index
    end
  end

  # ログアウト
  def delete
    reset_session
    redirect_to login_index_url, notice: 'ログアウトしました'
  end

  private
    def login_params
      params.require(:user).permit(:email, :password)
    end
end
