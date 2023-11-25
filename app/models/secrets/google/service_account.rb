# frozen_string_literal: true

module Secrets
  module Google
    class ServiceAccount
      ATTRS = %i[
        type
        project_id
        private_key_id
        private_key
        client_email
        client_id
        auth_uri
        token_uri
        auth_provider_x509_cert_url
        client_x509_cert_url
        universe_domain
      ].freeze

      delegate(*ATTRS, to: "Rails.application.credentials.google.service_account")

      def to_h
        ATTRS.to_h { [_1, public_send(_1)] }
      end

      def to_json(*_args)
        to_h.to_json
      end

      def to_json_io
        require "stringio"

        StringIO.new(to_json)
      end
    end
  end
end
