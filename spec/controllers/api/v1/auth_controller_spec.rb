require 'rails_helper'

RSpec.describe Api::V1::AuthController, type: :request do
  describe "#has_valid_token" do 
    context "user has valid token" do 
      let!(:user) { create(:user, email: 'testuser@localhost.com') }

      it "should return true/false if user has a valid token" do 
        get api_v1_has_valid_token_path, 
          params: {}, 
          headers: { 'Auth-Token' => user.authentication_token }
        json_response = JSON.parse(response.body)
        expect(json_response['has_valid_token']).to be_truthy 
      end

    end
    context "user has invalid token" do 
      let!(:user) { create(:user, email: 'testuser@localhost.com') }

      it "should return true/false if user has a valid token" do 
        get api_v1_has_valid_token_path
        json_response = JSON.parse(response.body)
        expect(json_response['has_valid_token']).to be_falsey
      end

    end

  end
end
