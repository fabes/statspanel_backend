require 'rails_helper'

RSpec.describe "User signing in", type: :request  do 
  let!(:user) { create(:user, email: 'testuser@localhost.com') }
  
  describe "successfully" do 

    it "should return a valid user with 200/success status" do 
      post api_v1_user_session_path, params: { email: 'testuser@localhost.com', password: 'pass1234' }
      expect(response.status).to eq(200)
    end
  end

  describe "unsuccessful with invalid email/password" do     
    it "should return 401/Unauthorized status" do 
      post api_v1_user_session_path, params: { email: 'invalid@localhost.com', password: 'invalid' }
      expect(response.status).to eq(401)
    end
  end
  
end