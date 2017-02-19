class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV["WEB_USERNAME"], password: ENV["WEB_PASSWORD"]

  def show
  end
end
