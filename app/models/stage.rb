class Stage < ApplicationRecord
  has_many :deals, dependent: :destroy
end
