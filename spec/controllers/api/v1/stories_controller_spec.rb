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
      expect(JSON.parse(response.body)['title']).to eql(@story_params[:title])
      expect(JSON.parse(response.body)['user_id']).to eql(@user.id)
    end

    it 'invalid params' do
      @story_params[:title] = nil
      post :create, {story: @story_params}
      expect(JSON.parse(response.body)).to have_key("errors")
    end
  end
end