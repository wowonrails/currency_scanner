FactoryBot.define do
  factory :rate do
    association :currency, factory: :currency, strategy: :build
    date_at { Time.zone.today }
    value 6.55
    expires_at { 10.minutes.from_now }
    forced true
  end
end
