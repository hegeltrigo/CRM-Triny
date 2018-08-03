class Deal < ApplicationRecord
  has_and_belongs_to_many :products
  belongs_to :company, optional: true
  belongs_to :stage, required: true
  belongs_to :user, required: true

  before_create :update_price
  before_update :update_price

  has_many :notes, inverse_of: :deal
  accepts_nested_attributes_for :notes, reject_if: :all_blank, allow_destroy: true

  scope :this_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }

  def update_price
    self.total_price = total_hours * (products.map(&:hourly_rate).sum)
  end
end
