# frozen_string_literal: true

module Calendars
  class Month
    def initialize(date)
      @date = date
    end

    def days
      @days ||= date.all_month.map { Day.new(date: _1) }
    end

    def weeks
      @weeks ||= days
        .group_by(&:cweek)
        .transform_values { |week_days| transform_week_days(week_days) }
        .map.with_index { |(cweek, week_days), mweek| Week.new(days: week_days, cweek:, mweek:) }
    end

    private

    attr_reader :date

    def transform_week_days(week_days)
      first_week_day = week_days.first.at_beginning_of_week

      (0...7)
        .map { first_week_day + _1.day }
        .map { _1.month == date.month ? Calendars::Day.new(date: _1) : Calendars::Day::NilDay.new }
    end
  end
end
