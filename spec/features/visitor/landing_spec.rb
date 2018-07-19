require 'rails_helper'

feature 'Landing' do
  let!(:rate) { create :rate }

  scenario "Visitor view 'Welcome' text" do
    visit root_path

    expect(page).to have_content('CurrencyScanner')
    expect(page).to have_content("1$ = #{rate.value} ₽")
  end
end
