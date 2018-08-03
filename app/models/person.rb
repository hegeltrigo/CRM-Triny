class Person < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :user, required: true

  scope :this_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }

end
