require 'rails_helper'

RSpec.describe Room, type: :model do
  let(:user) { FactoryBot.create(:alice) }
  let(:room) { FactoryBot.build(:room, user: user) }

  it 'nameが空白の場合無効であること' do
    room.name = ''
    expect(room).to_not be_valid
  end
end
