# frozen_string_literal: true

class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.order(created_at: :desc).page(page).per(per_page)
  end

  def show
    @schedule = Schedule.find(params[:id])
  end
end
