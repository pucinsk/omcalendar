# frozen_string_literal: true

module Gapps
  module Gmail
    module Messages
      class List < MessagesBaseService
        def perform
          authorize
          service.list_user_messages(context.email)
        end

        def user_id = context.email
      end
    end
  end
end
