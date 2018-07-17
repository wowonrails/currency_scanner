class Rate < ApplicationRecord
  belongs_to :currency

  validates :currency, :date_at, :value, :expires_at, presence: true

  scope :forced,      (-> { where(forced: true) })
  scope :real,        (-> { where(forced: false) })
  scope :not_expired, (-> { forced.where('expires_at > ?', Time.zone.now) })
end
