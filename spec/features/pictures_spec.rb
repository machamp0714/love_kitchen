# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Pictures", type: :feature do
  given(:user) { FactoryBot.create(:alice) }
  given!(:article) { FactoryBot.create(:alice_article, user: user) }

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
