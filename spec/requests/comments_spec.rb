# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Comments", type: :request do
  describe "POST #create" do
    it "ログインしていないユーザーはコメント出来ないこと" do
      post comments_path
      expect(response).to redirect_to login_url
    end
  end
end
