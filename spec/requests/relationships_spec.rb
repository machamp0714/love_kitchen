require 'rails_helper'

RSpec.describe "Relationships", type: :request do

  let(:user) { FactoryBot.create(:alice) }

  describe 'POST #create' do
    it 'ログインしていない場合、フォロー出来ないこと' do
      post relationships_path
      expect(response).to redirect_to login_url
    end
  end

  describe 'DELETE #destroy' do
    it 'ログインしていない場合、フォロー解除できないこと' do
      delete relationship_path(user)
      expect(response).to redirect_to login_url 
    end
  end
end
