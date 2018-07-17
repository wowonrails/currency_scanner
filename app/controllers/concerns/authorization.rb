module Authorization
  extend ActiveSupport::Concern

  included do
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :admin_not_authorized
  end

  private

  def admin_not_authorized
    redirect_to(root_path)
  end
end
