# frozen_string_literal: true

module Gapps
  module Emails
    class Message
      attr_reader :subject

      def initialize(subject:)
        @subject = subject
      end

      def where(email:)
        ListMessages.new(user_id: email).call
      end
    end
  end
end
