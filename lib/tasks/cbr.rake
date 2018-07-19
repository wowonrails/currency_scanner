namespace :sync do
  desc 'Update the dollar rate'
  task cbr: :environment do
    UsdRateSynchronizer.new.call
  end
end
