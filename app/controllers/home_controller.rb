class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where(organization_id: current_user.organization_id)
      .where.not(id: current_user.id)
  end
end
