require 'rails_helper'

RSpec.describe Comment, type: :model do

  let(:user) { FactoryBot.create(:alice) }
  let(:article) { FactoryBot.create(:alice_article, user: user) }
  let(:comment) { FactoryBot.create(:alice_comment, user: user, article: article) }

  it 'コメントが空白の場合無効であること' do
    comment.content = ""
    expect(comment).to_not be_valid
  end
end
