require 'rails_helper'

feature 'Landing' do
  scenario "Visitor view 'Welcome' text" do
    visit root_path

    expect(page).to have_content('CurrencyScanner')
  end
end
