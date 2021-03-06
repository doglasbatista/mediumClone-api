require 'rails_helper'

RSpec.describe Api::V1::StoriesController do
  describe 'POST #create' do
    before do
      @user = FactoryGirl.create(:batman)
      request.headers["Authorization"] = @user.access_token
      @story_params = FactoryGirl.attributes_for(:story)
    end

    it 'valid params' do
      post :create, {story: @story_params}
      expect(JSON.parse(response.body)['story']['title']).to eql(@story_params[:title])
      expect(JSON.parse(response.body)['story']['user']['username']).to eql(@user.username)
    end

    it 'invalid params' do
      @story_params[:title] = nil
      post :create, {story: @story_params}
      expect(JSON.parse(response.body)).to have_key("errors")
    end
  end

  describe 'GET #show' do
    before do
      @user = FactoryGirl.create(:user)
      @story = FactoryGirl.create(:story, user_id: @user.id)
    end

    it 'found' do
      get :show, id: @story.id
      expect(JSON.parse(response.body)['story']['title']).to eql(@story[:title])
    end

    it 'not found' do
      get :show, id: 2
      expect(JSON.parse(response.body)).to have_key("errors")
    end
  end
end