class DealProduct < ApplicationRecord
  belongs_to :deal, required: true
  belongs_to :product, required: true
end
