require 'rails_helper'

RSpec.feature "Relationships", type: :feature do

  given(:user) { FactoryBot.create(:alice) }
  given!(:other_user) { FactoryBot.create(:bob) }

  feature '他のユーザーをフォローしていない場合' do
    scenario 'フォローできること' do
      sign_in_as user
      visit "/bob"
      expect {
        click_on "フォロー"
      }.to change(Relationship, :count).by(1)
      expect(page).to have_css "#unfollow-button"
    end
  end

  feature '他のユーザーをフォローしている場合' do
    background do
      FactoryBot.create(:relationship, followed: other_user, follower: user)
    end
    scenario 'フォロー解除できること' do
      sign_in_as user
      visit "/bob"
      expect {
        click_on "解除する"
      }.to change(Relationship, :count).by(-1)
      expect(page).to have_css "#follow-button"
    end
  end
end
