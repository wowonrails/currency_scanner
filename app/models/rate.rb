class Rate < ApplicationRecord
  belongs_to :currency

  validates :currency, :date_at, :value, :expires_at, presence: true

  scope :forced, -> { where(forced: true) }
  scope :non_forced, -> { where(forced: false) }

  def self.build_from(rate)
    return new if rate.blank?
    new(rate.attributes)
  end
end
