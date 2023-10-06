# frozen_string_literal: true

Rails.application.config.generators do |c|
  c.orm :active_record, primary_key_type: :uuid
  c.system_tests = nil
end
