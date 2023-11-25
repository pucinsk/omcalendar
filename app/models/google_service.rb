# frozen_string_literal: true

class GoogleService
  def self.all
    [
      Google::Apis::GmailV1::AUTH_GMAIL_READONLY,
    ].map { new(scope: _1) }
  end

  attr_reader :scope

  def initialize(scope: all.first)
    @scope = scope
  end

  def enabled_for_account?(account)
    account.google_services[scope].present?
  end
end
