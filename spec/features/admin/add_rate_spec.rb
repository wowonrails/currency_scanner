require 'rails_helper'

feature 'Add Rate' do
  include_context 'when current admin signed in'

  let!(:rate) { create :rate }

  scenario 'Admin observes last rate values and creates rate' do
    visit admin_root_path

    expect(page).to have_content('Enter the Value of the Dollar Rateand the Expiry Date')
    expect(page).to have_field('rate[value]', with: rate.value)
    expect(page).to have_field('rate[expires_at]', with: rate.expires_at.strftime('%d-%m-%Y %H:%M'))

    fill_in 'Value',            with: '55.5555'
    fill_in 'rate[expires_at]', with: 15.minutes.from_now

    click_on(submit(:rate, :create))

    expect(page).to have_content('1$ = 55,56 ₽')
  end
end
