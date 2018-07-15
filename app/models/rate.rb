class Rate < ApplicationRecord
  belongs_to :currency

  validates :currency, :date_at, :value, :expires_at, presence: true
end
