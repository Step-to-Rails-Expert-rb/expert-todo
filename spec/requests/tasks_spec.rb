require "rails_helper"

RSpec.describe "Tasks", type: :request do
  
  let(:task) {create(:task)}
  
  
  describe "GET /tasks" do
    before do
      sign_in task.user
    end
    
    it "responses with 200" do
      get "/tasks"
      expect(response).to have_http_status(200)
    end
  end
end
