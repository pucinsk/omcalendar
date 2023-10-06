# frozen_string_literal: true

module Calendars
  class Day
    attr_reader :date

    delegate_missing_to :date

    def initialize(date:)
      @date = date
    end
  end
end
