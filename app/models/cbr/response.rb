class Cbr::Response < Dry::Struct
  KEYS = -> (key) do
    key.downcase.to_sym
  end

  transform_keys(KEYS)

  attribute :date,   Types::Strict::Date.constructor { |v| v.to_date }
  attribute :valute, Types::Strict::Hash.constructor { |v| { usd: v["USD"] } }
end
