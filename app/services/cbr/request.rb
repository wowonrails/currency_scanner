class Cbr::Request
  URL = 'https://www.cbr-xml-daily.ru/daily_json.js'.freeze

  def initialize
    @connection = Faraday.new do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.response :json
    end
  end

  def response
    @connection.get(URL).body
  end
end
