require 'rails_helper'

RSpec.describe "Rooms", type: :request do
  let(:room) { FactoryBot.create(:room) }

  describe 'GET #index' do
    it 'ログインしていない場合リダイレクトされること' do
      get rooms_path
      expect(response).to redirect_to login_url
    end
  end

  describe 'GET #show' do
    it 'ログインしていない場合リダイレクトされること' do
      get room_path(room)
      expect(response).to redirect_to login_url
    end
  end

  describe 'POST #create' do
    it 'ログインしていないユーザーはリダイレクトされること' do
      post rooms_path
      expect(response).to redirect_to login_url
    end
  end

  describe 'PATCH #update' do
    it 'ログインしていない場合リダイレクトされること' do
      patch room_path(room)
      expect(response).to redirect_to login_url
    end
  end

  describe 'DELETE #destroy' do
    it 'ログインしていない場合リダイレクトされること' do
      delete room_path(room)
      expect(response).to redirect_to login_url
    end
  end
end
