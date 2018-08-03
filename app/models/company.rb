class Company < ApplicationRecord
  has_many :people
  belongs_to :user, required: true

  scope :this_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }

end
