require 'rails_helper'

describe UsdRateSynchronizer do
  describe '#call' do
    context 'when rate is present' do
      let(:expected_date_at) { '2018-07-20T11:30:00+03:00' }
      let(:initial_value)    { 10.10 }
      let(:expected_value)   { 63.27 }
      let(:currency)         { create :currency }

      let!(:rate) do
        create :rate,
          currency: currency,
          date_at: expected_date_at,
          forced: false,
          value: initial_value
      end

      let(:body) do
        {
          'Date' => expected_date_at,
          'Valute' => {
            'USD' => {
              'Value' => expected_value
            }
          }
        }
      end

      before do
        request = instance_spy(Cbr::Request, response: body)

        allow(Cbr::Request).to receive(:new).and_return(request)
      end

      it 'updates rate value' do
        expect {
          described_class.new.call
        }.to change {
          rate.reload.value
        }.from(initial_value).to(expected_value)
      end

      it 'broadcastes to rate_update_channel' do
        expect do
          described_class.new.call
        end.to have_broadcasted_to('rate_update_channel').with(rate_value: expected_value)
      end
    end

    context 'when rate is not present' do
      let(:expected_date_at) { '2018-07-20T11:30:00+03:00' }
      let(:expected_value)   { 63.27 }

      let(:body) do
        {
          'Date' => expected_date_at,
          'Valute' => {
            'USD' => {
              'Value' => expected_value
            }
          }
        }
      end

      before do
        create :currency

        request = instance_spy(Cbr::Request, response: body)

        allow(Cbr::Request).to receive(:new).and_return(request)
      end

      it 'creates new rate' do
        expect {
          described_class.new.call
        }.to change(Rate, :count).from(0).to(1)
      end

      it 'broadcastes to rate_update_channel' do
        expect {
          described_class.new.call
        }.to have_broadcasted_to('rate_update_channel').with(rate_value: expected_value)
      end
    end
  end
end
