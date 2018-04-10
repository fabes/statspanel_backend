require 'rails_helper'

RSpec.describe User, type: :model do
  describe "valid user" do 
    let!(:user) { create(:user) }

    it "should have an email and token" do 
      expect(user.email).not_to be_nil()
      expect(user.authentication_token).not_to be_nil()
    end
  end
end