# frozen_string_literal: true

require "googleauth/stores/file_token_store"

class GoogleServicesAccessController < ApplicationController
  def request_access
    scope = Google::Apis::GmailV1::AUTH_GMAIL_READONLY

    client_id = Google::Auth::ClientId.from_hash(
      { "web" => { "client_id" => Secrets::Google::WebClient.new.client_id,
                   "client_secret" => Secrets::Google::WebClient.new.client_secret } },
    )
    token_store = Google::Auth::Stores::FileTokenStore.new(
      file: "tokens.yaml",
    )
    authorizer = Google::Auth::WebUserAuthorizer.new(
      client_id, scope, token_store, oauth2callback_path
    )

    user_id = "j.pucinskas@gmail.com"
    credentials = authorizer.get_credentials(user_id, request)
    if credentials.nil?
      redirect_to(authorizer.get_authorization_url(login_hint: user_id, request:),
                  allow_other_host: true)

    else
      redirect_to root_path, notice: "I ve been here"
    end
  end

  def oauth2callback
    Array(params[:scope]).first.split.grep(%r{googleapis.com/auth}).each do |scope|
      current_account.update(
        google_services: current_account.google_services.merge(scope => params[:code]),
      )
    end

    target_url = Google::Auth::WebUserAuthorizer.handle_auth_callback_deferred(
      request,
    )
    redirect_to target_url
  end
end
