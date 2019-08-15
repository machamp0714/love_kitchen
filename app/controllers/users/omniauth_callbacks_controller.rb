# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    callback_from :twitter
  end

  private
    def callback_from(provider)
      provider = provider.to_s

      @user = User.find_for_oauth(request.env["omniauth.auth"])

      if @user.persisted?
        flash[:notice] = "ログインしました。"
        sign_in_and_redirect @user, event: :authentication
      else
        redirect_to signup_path, alert: "ユーザー認証に失敗しました。"
      end
    end
end
