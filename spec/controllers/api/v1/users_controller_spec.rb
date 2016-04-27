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
      expect(JSON.parse(response.body)["user"]["email"]).to eql(@user_params[:email])
    end

    it 'post with invalid params' do
      @user_params[:email] = nil
      post :create, { user: @user_params }
      expect(JSON.parse(response.body)).to have_key("errors")
    end

  end

  describe 'PATCH #update' do
    before do
      @user = FactoryGirl.create(:batman)
      request.headers["Authorization"] = @user.access_token
    end

    it 'valid params' do
      patch :update, { id: @user.id, user: { email: 'bat@wayne.corp' } }
      expect(JSON.parse(response.body)["user"]["email"]).to eql('bat@wayne.corp')
    end

    it 'invalid params' do
      patch :update, { id: @user.id, user: { email: '' } }
      expect(JSON.parse(response.body)).to have_key("errors")
    end

    it 'without authorization' do
      request.headers["Authorization"] = '100:bfjsbadfbasdjk'
      patch :update, { id: @user.id, user: { email: '' } }
      expect(JSON.parse(response.body)).to have_key("errors")
    end
  end

  describe 'GET #show' do
    before do
      @user = FactoryGirl.create(:batman)
      5.times { FactoryGirl.create(:story, user: @user) }
    end

    it 'display all stories' do
      get :show, id: @user.id
      expect(JSON.parse(response.body)['users'][0]['title']).to eql(@user.stories.first.title)
      expect(JSON.parse(response.body)['users'][-1]['title']).to eql(@user.stories.last.title)
    end
  end

end