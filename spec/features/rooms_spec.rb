# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Rooms", type: :feature do
  given(:user) { FactoryBot.create(:alice) }
  given!(:room) { FactoryBot.create(:room, user: user) }

  scenario "新しくスレッドを作成できること", js: true do
    sign_in_as user
    visit rooms_path
    click_button "スレッドを作成する"
    expect {
        fill_in "room[title]", with: "lovekitchen", match: :first
        click_on "作成"
    }.to change(Room, :count).by(1)

    expect(page).to have_content "lovekitchen"
    expect(page).to have_content "スレッドを作成しました。"
  end

  scenario "スレッドを編集できること", js: true do
    sign_in_as user
    visit rooms_path
    click_link "編集"
    fill_in "edit-room-title", with: "edit title"
    click_on "更新"
    expect(page).to have_content "edit title"
    expect(page).to have_content "スレッドを更新しました。"
  end

  scenario "スレッドを削除できること" do
    sign_in_as user
    visit rooms_path
    expect {
      click_link "削除"
    }.to change(Room, :count).by(-1)
    expect(page).to have_content "スレッドを削除しました。"
  end
end
