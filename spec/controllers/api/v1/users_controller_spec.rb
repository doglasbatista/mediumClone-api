require 'rails_helper'

RSpec.describe Api::V1::UsersController do
  describe 'POST #create' do
    before do
      @user_params =
      {
        username: 'morcegao',
        email: 'bruce@wayne.corp',
        password: '123123123',
        password_confirmation: '123123123'
      }
    end

    it 'post with valid params' do
      post :create, { user: @user_params }
      expect(JSON.parse(response.body)['email']).to eql(@user_params[:email])
    end

    it 'post with invalid params' do
      @user_params[:email] = nil
      post :create, { user: @user_params }
      expect(JSON.parse(response.body)).to have_key("errors")
    end

  end
end