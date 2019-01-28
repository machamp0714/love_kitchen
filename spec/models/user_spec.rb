require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryBot.create(:alice) }

  describe 'ユーザーの有効性について' do
    context '有効な情報の場合' do
      it '有効であること' do
        expect(user).to be_valid
      end
    end
  end
end
