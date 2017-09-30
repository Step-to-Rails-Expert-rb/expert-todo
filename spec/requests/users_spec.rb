require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "GET /users/sign_up" do
    it "responses with 200" do
      get "/users/sign_up"
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /users" do
    it "creates a user" do
      expect do
        post "/users", params: { user: attributes_for(:user, :sign_up) }
      end.to change(User, :count).by(1)
      expect(response).to redirect_to root_path
    end
  end

  describe "GET /users/sign_in" do
    it "responses with 200" do
      get "/users/sign_in"
      expect(response).to have_http_status(200)
    end
  end

  describe "login/logout" do
    let(:user) { create :user }

    describe "POST /users/sign_in" do
      it "signs in and out" do
        post "/users/sign_in", params: { user: attributes_for(:user, email: user.email) }
        expect(response).to redirect_to tasks_path
        expect(controller.current_user).to eq(user)
        delete "/users/sign_out"
        expect(controller.current_user).to eq nil
      end
    end
  end
end
