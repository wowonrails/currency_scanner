namespace :cbr do
  task sync: :environment do
    UsdRateSynchronizer.new.call
  end
end
