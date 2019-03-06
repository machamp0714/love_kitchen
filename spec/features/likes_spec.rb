require 'rails_helper'

RSpec.feature "Likes", type: :feature do

  given(:user) { FactoryBot.create(:alice) }
  given(:other_user) { FactoryBot.create(:bob) }
  given!(:article) { FactoryBot.create(:bob_article, user: other_user) }

  scenario '「いいね」できること' do
    sign_in_as user
    click_link article.title
    expect {
      find('.likable').click
    }.to change(Like, :count).by(1)
    expect(page).to have_css '.liked'
  end
end
