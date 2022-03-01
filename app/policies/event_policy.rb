class EventPolicy < ApplicationPolicy
  def create?
    return true
  end
  def update?
    record.user == user
    # - record: the evebt passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user
  end
end
