class Currency < ApplicationRecord
  has_many :rates, dependent: :destroy

  def self.default
    find_or_create_by(name: 'USD')
  end
end
