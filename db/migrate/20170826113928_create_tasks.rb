class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.belongs_to :user,    null: false, index: true
      t.string     :title,    null: false               # タイトル
      t.text       :detail,   null: false, default: ''  # 詳細
      t.integer    :priority, null: false               # 優先度
      t.integer    :status,   null: false               # ステータス
      t.timestamp  :scheduled_start_at                  # 予定開始日時
      t.timestamp  :scheduled_end_at                    # 予定終了日時
      t.timestamp  :finished_at                         # 完了日時
      t.timestamps
    end
  end
end
