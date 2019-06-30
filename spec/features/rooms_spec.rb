require 'rails_helper'

RSpec.feature "Rooms", type: :feature do
  given(:user) { FactoryBot.create(:alice) }
  given(:room) { FactoryBot.build(:room) }

  scenario '新しくスレッドを作成できること', js: true do
    sign_in_as user
    visit rooms_path
    click_button 'スレッドを作成する'
    expect {
        fill_in 'room[title]', with: room.title
        click_on '作成'
    }.to change(Room, :count).by(1)

    expect(page).to have_content room.title
    expect(page).to have_content 'スレッドを作成しました。'
  end
end
