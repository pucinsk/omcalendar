# frozen_string_literal: true

module Secrets
  module Google
    class WebClient
      ATTRS = %i[
        client_id
        project_id
        auth_uri
        token_uri
        auth_provider_x509_cert_url
        client_secret
        redirect_uris
      ].freeze

      delegate(*ATTRS, to: "Rails.application.credentials.google.clients.web")
    end
  end
end
