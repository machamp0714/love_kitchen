require 'rails_helper'

RSpec.feature "Relationships", type: :feature do

  given(:user) { FactoryBot.create(:alice) }
  given!(:other_user) { FactoryBot.create(:bob) }

  scenario '他のユーザーをフォローできること' do
    sign_in_as user
    visit "/bob"
    expect {
      click_on "フォロー"
    }.to change(Relationship, :count).by(1)
    expect(page).to have_css "#unfollow-button"
  end
end
