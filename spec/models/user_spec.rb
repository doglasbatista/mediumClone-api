require 'rails_helper'

RSpec.describe User do
  describe 'validation' do
    it { should validate_presence_of(:username) }
  end

  describe 'generate_access_token' do
    before do
      @user = FactoryGirl.create(:user)
    end

    it { expect(@user.access_token).not_to be_empty }
  end
end