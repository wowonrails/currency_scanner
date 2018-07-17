class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!

  def pundit_user
    Admin.find(current_admin.id)
  end
end
