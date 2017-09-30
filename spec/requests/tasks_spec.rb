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

  describe "GET /tasks/:id/edit" do
    it "responses with 200" do
      get "/tasks/#{task.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end
end
