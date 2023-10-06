# frozen_string_literal: true

module Calendars
  class Day
    class NilDay
      def to_s(_format = nil)
        ""
      end
    end

    attr_reader :date

    delegate_missing_to :date

    def initialize(date:)
      @date = date
    end

    def to_s(format = :default)
      return super unless format == :calendar_day

      day.to_s.rjust(2, "0")
    end
  end
end
