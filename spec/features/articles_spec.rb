require 'rails_helper'

RSpec.feature "Articles", type: :feature do

  given(:alice) { FactoryBot.create(:alice) }

  scenario '記事を投稿できること' do
    sign_in_as alice
    click_link "投稿する"
    expect {
      fill_in "タイトル", with: "アルミパン"
      fill_in "ストーリー", with: "アルミパンはコスパがいい"
      click_on "投稿"
    }.to change(Article, :count).by(1)
    expect(page).to have_content "Success!!"
  end
end
