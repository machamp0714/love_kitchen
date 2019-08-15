# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Pictures", type: :feature do
  given(:user) { FactoryBot.create(:alice) }
  given(:image_path) { Rails.root.join("spec", "fixtures", "love_kitchen.png") }
  given!(:article) { FactoryBot.create(:alice_article, user: user) }
  given!(:max_uploaded_article) { FactoryBot.create(:max_uploaded_article, user: user) }

  scenario "写真を追加できること" do
    sign_in_as user
    click_link article.title
    click_link "編集する"
    click_link "写真"
    attach_file "picture[image]", image_path
    expect {
      click_on "更新する"
    }.to change(Picture, :count).by(1)
  end

  scenario "写真の数が上限に達している時、新たに追加出来ないこと" do
    sign_in_as user
    click_link max_uploaded_article.title
    click_link "編集する"
    click_link "写真"
    attach_file "picture[image]", image_path
    click_on "更新する"
    expect(page).to have_content  "写真はこれ以上追加出来ません。"
  end

  scenario "写真を削除できること" do
    sign_in_as user
    click_link article.title
    click_link "編集する"
    click_link "写真"
    expect {
      find(".picture-delete-button").click
    }.to change(Picture, :count).by(-1)
  end
end
