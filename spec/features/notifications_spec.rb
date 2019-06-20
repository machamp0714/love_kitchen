require 'rails_helper'

RSpec.feature "Notifications", type: :feature do
  given(:user) { FactoryBot.create(:alice) }
  given(:other_user) { FactoryBot.create(:bob) }
  given!(:article) { FactoryBot.create(:bob_article, user: other_user) }

  scenario 'ユーザーの記事がいいねされた時、通知が来ること' do
    sign_in_as user
    click_link article.title
    expect {
      find('.likable').click
    }.to change(Notification, :count).by(1)
    click_link 'ログアウト'

    sign_in_as other_user

    expect(page).to have_content 1
    expect(page).to have_content "#{user.name}さんが、#{article.title}にいいねを付けました！"

    click_link '既読にする'

    expect(page).to_not have_content 1
  end
end
