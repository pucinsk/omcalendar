# frozen_string_literal: true

module Gapps
  module Gmail
    module Messages
      class List < MessagesBaseService
        def perform
          authorize
          context.response = response
          context.messages = messages
        end

        def user_id = context.email

        def messages
          @messages ||= response.messages.map do |message|
            Get.perform(email: user_id, message_id: message.id).message
          end
        end

        def response
          @response ||= service.list_user_messages(user_id, max_results: 5)
        end
      end
    end
  end
end
