module SessionSupport
    def sign_in_as(user)
        visit root_path
        click_link "ログイン"
        fill_in "メールアドレス", with: user.email
        fill_in "パスワード", with: user.password
        click_on "ログインする"
    end
end

RSpec.configure do |config|
    config.include SessionSupport
end