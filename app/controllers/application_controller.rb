# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_account!

  def page = params[:page]
  def per_page = params[:per_page]
end
