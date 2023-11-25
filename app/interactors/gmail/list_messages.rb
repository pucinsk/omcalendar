# frozen_string_literal: true

module Gmail
  class ListMessages
    def call(user_id:)
      service.list_user_messages(user_id)
    end

    private

    def auth_client
      @auth_client ||= client_secrets.to_authorization.tap do |ac|
        ac.update!(
          scope: Google::Apis::GmailV1::AUTH_GMAIL_READONLY,
          redirect_uri: "http://localhost:3000/",
        )
      end
    end

    def client_secrets
      @client_secrets ||= Google::APIClient::ClientSecrets.load
    end

    def before
      authorize
    end

    def authorize
      service.authorization = authorization
    end

    def service
      @service ||= Google::Apis::GmailV1::GmailService.new
    end
  end
end
