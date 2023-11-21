# frozen_string_literal: true

module Accounts
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2 # rubocop:disable Metrics/AbcSize
      # You need to implement the method below in your model (e.g. app/models/account.rb)
      @account = Account.from_omniauth(request.env["omniauth.auth"])

      if @account.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: "Google"
        sign_in_and_redirect @account, event: :authentication
      else
        # Removing extra as it can overflow some session stores
        session["devise.google_data"] = request.env["omniauth.auth"].except("extra")
        redirect_to new_account_registration_url, alert: @account.errors.full_messages.join("\n")
      end
    end
  end
end
