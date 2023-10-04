# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def page = params[:page]
  def per_page = params[:per_page]
end
