class AdminPolicy < ApplicationPolicy
  def new?
    user == record
  end
end
