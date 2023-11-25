# frozen_string_literal: true

require "googleauth/stores/file_token_store"

module Gapps
  module Gmail
    module Messages
      class MessagesBaseService < ApplicationInteractor
        private

        def service
          @service ||= Google::Apis::GmailV1::GmailService.new
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

        def authorizer
          @authorizer ||= Google::Auth::UserAuthorizer.new(
            client_id, Google::Apis::GmailV1::AUTH_GMAIL_READONLY,
            token_store
          )
        end

        def authorize
          service.authorization = authorizer.get_credentials(context.email)
        end

        def secrets
          Secrets::Google::WebClient.new
        end

        def token_store
          @token_store ||= Google::Auth::Stores::FileTokenStore.new(file: "tokens.yaml")
        end
      end
    end
  end
end
