# frozen_string_literal: true

module Gapps
  module Gmail
    module Messages
      class Get < MessagesBaseService
        def perform
          authorize
          context.message = message
        end

        private

        def user_id = context.email

        def message
          @message ||= Message.new(subject:)
        end

        def subject
          response.payload.headers.find { _1.name == "Subject" }&.value
        end

        def response
          @response ||= service.get_user_message(user_id, context.message_id)
        end
      end
    end
  end
end
