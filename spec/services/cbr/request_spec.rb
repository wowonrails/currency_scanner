require 'rails_helper'

describe Cbr::Request do
  describe '#response' do
    let(:url) { Cbr::Request::URL }

    let(:body) do
      {
        'Date' => '2018-07-20T11:30:00+03:00',
        'Valute' => {
          'USD' => {
            'Value' => 63.27
          }
        }
      }
    end

    let!(:connection) do
      Faraday.new do |builder|
        builder.adapter :test do |stub|
          stub.get(url) { |_| [200, {}, body] }
        end
      end
    end

    before do
      allow(Faraday).to receive(:new).and_return(connection)
    end

    it 'returns body' do
      result = described_class.new.response

      expect(result).to eq(body)
    end
  end
end
