# frozen_string_literal: true

require "googleauth/stores/file_token_store"

class GoogleServicesController < ApplicationController
  def index
    @services = GoogleService.all
  end

  def flip
    token_store = Google::Auth::Stores::FileTokenStore.new(file: "tokens.yaml")
    service = GoogleService.all.find { _1.scope == params[:scope] }
    user_id = current_account.email

    if ActiveModel::Type::Boolean.new.cast(params[:enable])
      scope = service.scope
      client_id = Google::Auth::ClientId.from_hash(
        { "web" => { "client_id" => Secrets::Google::WebClient.new.client_id,
                     "client_secret" => Secrets::Google::WebClient.new.client_secret } },
      )

      authorizer = Google::Auth::WebUserAuthorizer.new(
        client_id, scope, token_store, oauth2callback_path
      )
      credentials = authorizer.get_credentials(user_id, request)

      if credentials.nil?

        redirect_to(authorizer.get_authorization_url(login_hint: user_id, request:),
                    allow_other_host: true)

      else
        redirect_to google_services_path, notice: "I ve been hereeee"
      end
    else
      token_store.delete(current_account.email)
      google_services = current_account.google_services.tap { _1.delete(service.scope) }
      current_account.update(google_services:)
      redirect_to google_services_path
    end
  end
end
