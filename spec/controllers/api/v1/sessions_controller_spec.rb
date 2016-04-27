require 'rails_helper'

RSpec.describe Api::V1::SessionsController do
  describe 'POST #create' do
    before do
      @user = FactoryGirl.create(:batman)
    end

    it 'successful login' do
      post :create, { email: @user.email, password: @user.password }
      expect(JSON.parse(response.body)['user']['email']).to eql(@user.email)
    end

    it 'unsuccessful login' do
      post :create, { email: @user.email, password: "i'm batman" }
      expect(JSON.parse(response.body)).to have_key("errors")
    end
  end
end