class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @dashboard_data = DashboardService.new(current_user).generate_dashboard_data
  end
end
