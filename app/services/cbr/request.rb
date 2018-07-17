class Cbr::Request < ApplicationService
  URL = 'https://www.cbr-xml-daily.ru/daily_json.js'.freeze

  def initialize
    @connection = Faraday.new do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def call
    JSON.parse(@connection.get(URL).body)
  end
end
