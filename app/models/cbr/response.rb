class Cbr::Response < Dry::Struct
  KEYS = ->(key) { key.downcase.to_sym }

  transform_keys(KEYS)

  attribute :date,   Types::Strict::Date.constructor(&:to_date)
  attribute :valute, (Types::Strict::Hash.constructor { |v| { usd: v['USD'] } })
end
