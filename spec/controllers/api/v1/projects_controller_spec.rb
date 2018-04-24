require 'rails_helper'

RSpec.describe Api::V1::ProjectsController, type: :request do
  describe "#index" do 
    let!(:user){ create :user }

    before do 
      create :project, user: user, code: SecureRandom.hex(3)
      create :project, user: user, name: 'Test 2 project', code: SecureRandom.hex(3)
    end

    it "should return a json response" do 
      get api_v1_projects_path, 
      params: {}, 
      headers: { 'Auth-Token' => user.authentication_token }
      expect(response.headers["Content-Type"]).to eq('application/json; charset=utf-8') 
    end

  end
end
