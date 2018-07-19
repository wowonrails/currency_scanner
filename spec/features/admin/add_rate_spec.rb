require 'rails_helper'

feature 'Add Rate' do
  include_context 'when current admin signed in'

  let!(:rate) { create :rate }

  scenario 'Admin creates rate' do
    visit root_path

    expect(page).to have_content("1$ = ₽ #{rate.value}")

    click_link 'Create Rate'

    expect(page).to have_content('Enter the Value of the Dollar Rateand the Expiry Date')
    expect(find_field('rate[value]').value).to      eq(rate.value.to_s)
    expect(find_field('rate[expires_at]').value).to eq(rate.expires_at.strftime('%d-%m-%Y %H:%M'))

    fill_in 'Value',            with: '55.5555'
    fill_in 'rate[expires_at]', with: 15.minutes.from_now
    click_button 'Save'

    expect(page).to have_content('1$ = ₽ 55.56')
  end
end
