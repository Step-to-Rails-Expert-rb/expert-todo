require "rails_helper"

RSpec.describe "Tasks", type: :request do
  let(:task) { create(:task) }

  before do
    sign_in task.user
  end

  describe "GET /tasks" do
    it "responses with 200" do
      get "/tasks"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /tasks/new" do
    it "responses with 200" do
      get "/tasks/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /tasks" do
    it "creates a task" do
      expect do
        post "/tasks", params: { task: attributes_for(:task) }
      end.to change(Task, :count).by(1)
      expect(response).to redirect_to tasks_path
    end
  end

  describe "GET /tasks/:id/edit" do
    it "responses with 200" do
      get "/tasks/#{task.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /tasks/:id" do
    it "changes a task" do
      patch "/tasks/#{task.id}",
            params: { task: attributes_for(:task, task_name: "変更されたタスク名") }
      task.reload
      expect(task.task_name).to eq "変更されたタスク名"
    end
  end

  describe "DELETE /tasks/:id" do
    it "deletes a task" do
      expect do
        delete "/tasks/#{task.id}"
      end.to change(Task, :count).by(-1)
    end
  end
end
