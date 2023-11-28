# frozen_string_literal: true

module Gapps
  module Gmail
    class Message
      attr_reader :subject

      def initialize(subject:)
        @subject = subject
      end
    end
  end
end
