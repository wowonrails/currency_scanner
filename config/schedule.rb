# frozen_string_literal: true

every 10.minutes do
  rake 'cbr:sync'
end
