require "rails_helper"

RSpec.describe "Tasks", type: :system do
  before do
    driven_by(:rack_test)
  end

  context do
    let(:user) { create :user }

    before do
      login_as user
    end

    it "creates new task" do
      visit "/tasks"

      click_link "新規作成"

      within "#new_task" do
        fill_in "タスク名", with: "資料の作成"
        click_button "登録"
      end

      expect(Task.count).to eq 1
    end
  end

  context do
    let(:task) { create :task }

    before do
      login_as task.user
    end

    it "updates task" do
      visit "/tasks"
      within("#task_#{task.id}") { click_link "編集" }
      within "#edit_task_#{task.id}" do
        fill_in "タスク名", with: "変更後のタスク名"
        fill_in "詳細", with: "変更後の詳細"

        click_button "登録"
      end
      expect(Task.find_by(task_name: "変更後のタスク名")).not_to be_nil
      expect(Task.find_by(description: "変更後の詳細")).not_to be_nil
    end

    it "destroy task" do
      visit "/tasks"
      within("#task_#{task.id}") { click_link "削除" }
      expect(Task.count).to eq 0
    end
  end
end
