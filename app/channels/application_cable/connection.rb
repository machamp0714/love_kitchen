# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private
      def find_verified_user
        User.find(session["warden.user.user.key"][0][0])
      rescue
        reject_unauthorized_connection
      end

      def session
        @session ||= cookies.encrypted[Rails.application.config.session_options[:key]]
      end
  end
end
