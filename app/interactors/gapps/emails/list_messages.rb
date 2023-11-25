# frozen_string_literal: true

require "googleauth/stores/file_token_store"

module Gapps
  module Emails
    class ListMessages
      attr_reader :user_id

      def initialize(user_id:)
        @user_id = user_id
      end

      def call
        authorize
        service.list_user_messages(user_id)
      end

      private

      def token_store
        @token_store ||= Google::Auth::Stores::FileTokenStore.new(file: "tokens.yaml")
      end

      def client_id
        @client_id ||= Google::Auth::ClientId.from_hash(
          {
            "web" => {
              "client_id" => secrets.client_id,
              "client_secret" => secrets.client_secret,
            },
          },
        )
      end

      def authorize
        service.authorization = authorizer.get_credentials(user_id)
      end

      def authorizer
        @authorizer ||= Google::Auth::UserAuthorizer.new(client_id, Google::Apis::GmailV1::AUTH_GMAIL_READONLY,
                                                         token_store)
      end

      def service
        @service ||= Google::Apis::GmailV1::GmailService.new
      end

      def secrets
        Secrets::Google::WebClient.new
      end
    end
  end
end
