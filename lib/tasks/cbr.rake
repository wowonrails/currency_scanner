namespace :cbr do
  task sync: :environment do
    SyncDollarRate.call
  end
end
