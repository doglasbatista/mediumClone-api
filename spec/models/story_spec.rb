require 'rails_helper'

RSpec.describe Story do
  describe 'validation' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:user_id) }
  end

  describe 'association' do
    it { should belong_to(:user) }
  end

end