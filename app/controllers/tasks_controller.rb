class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    before_action :correct_user, only: [:show, :edit, :update, :destroy]
    def index
        
    end
    
    def new
      # buildってなんだろう。引数がないbuildは空の箱を作ってるイメージかな？
      @task = current_user.tasks.build
    end
    
    def edit
      # before_actionで設定することにしたのでこの記述は不要になった。
      # @task = Task.find(params[:id])
    end
    def create
      @task = current_user.tasks.build(task_params)
      if @task.save
        flash[:success] = "タスクを生成しました!"
        redirect_to root_url
      else
        # 失敗時の処理
        @task_items = []
        render :new
      end
    end
    
    def update
      if @task.update(task_params)
        flash[:success] = "タスクを更新しました！"
        redirect_to root_url
      else
        render :edit
      end
      
    end
    
    def destroy
      @task = current_user.tasks.find_by(id: params[:id])
      @task.destroy
      flash[:success] = "タスクを削除しました。"
      redirect_to request.referrer || root_url
    end
    
    private
      def task_params
        params.require(:task).permit(:content,:description,:deadline)
      end
      
      def set_task
        @task = Task.find(params[:id])
      end
      
      # 自分のではないタスクにアクセスしようとした場合はエラー
      def correct_user
        if current_user.id != @task.user_id
          flash[:danger] = "不正アクセス"
          redirect_to(root_url) unless current_user.id == @task.user_id
        end
      end
end
