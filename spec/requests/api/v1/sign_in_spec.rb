require 'rails_helper'

RSpec.describe "User signing in", type: :request  do 
  let!(:user) { create(:user, email: 'testuser@localhost.com') }
  
  describe "successfully" do 
    before do 
      sign_in(user)
    end

    it "should return a valid user" do 
      expect(user.email).to eq('testuser@localhost.com')
      expect(user).not_to be_nil()
    end

    it "should have an auth token" do
      expect(user.authentication_token).not_to be_nil()
    end
  end

  describe "unsuccessful with invalid email/password" do     
    it "should return nil" do 
      invalid_user = User.find_by(email: 'invaliduser@localhost.com')
      expect(invalid_user).to be_nil()
    end
  end
end