class Note < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :deal

  before_create :update_user

  def update_user
    self.user = User.current
  end

end
