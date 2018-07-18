FactoryBot.define do
  factory :rate do
    currency
    date_at { Time.zone.today }
    value 6.5
    expires_at { Faker::Time.forward(1, :morning) }
    forced true
  end
end
