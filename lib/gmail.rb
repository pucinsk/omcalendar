# frozen_string_literal: true

require "googleauth"
require "googleauth/stores/file_token_store"
require "fileutils"

class Gmail
  OOB_URI = "urn:ietf:wg:oauth:2.0:oob"
  class << self
    def client_secrets_path
      well_known_path_for("omc-dev.json")
    end

    # Returns the path to the token store.
    def token_store_path
      well_known_path_for("credentials.yaml")
    end

    # Builds a path to a file in $HOME/.config/google (or %APPDATA%/google,
    # on Windows)
    def well_known_path_for(file)
      Rails.root.join("lib", "gmail", file).to_s
    end

    # Returns application credentials for the given scope.
    def application_credentials_for(scope)
      Google::Auth.get_application_default(scope)
    end

    # Returns user credentials for the given scope. Requests authorization
    # if requrired.
    def user_credentials_for(scope) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
      FileUtils.mkdir_p(File.dirname(token_store_path))

      client_id = Google::Auth::ClientId.from_file(client_secrets_path)
      token_store = Google::Auth::Stores::FileTokenStore.new(file: token_store_path)
      Google::Auth::UserAuthorizer.new(client_id, scope, token_store)

      user_id = "j.pucinskas@gmail.com"

      authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
        json_key_io: File.open("omc-dev.json"),
        scope:,
        token_store:,
      )
      credentials = authorizer.get_credentials(user_id)
      if credentials.nil?
        url = authorizer.get_authorization_url(base_url: OOB_URI)
        Rails.logger.debug "Open the following URL in your browser and authorize the application."
        Rails.logger.debug url
        binding.pry
        code = ask "Enter the authorization code:"
        credentials = authorizer.get_and_store_credentials_from_code(
          user_id:, code:, base_url: OOB_URI,
        )
      end
      credentials
    end

    def op
      ":)"
    end
  end
end
