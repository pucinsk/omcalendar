# frozen_string_literal: true

module Calendars
  class Week
    attr_reader :days, :cweek, :mweek

    def initialize(days:, cweek:, mweek:)
      @days = days
      @cweek = cweek
      @mweek = mweek
    end
  end
end
