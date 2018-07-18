require 'rails_helper'

feature 'Sign In' do
  let(:admin) { create :admin }

  def sign_in(email, password)
    visit new_admin_session_path

    fill_form(:admin, email: email, password: password)
    click_button 'Sign in'
  end

  scenario 'Visitor signs in with valid credentials' do
    sign_in(admin.email, admin.password)

    expect(page).to have_content('Sign out')
  end

  scenario 'Visitor signs in with invalid credentials' do
    sign_in(admin.email, 'wrong password')

    expect(page).to have_content('Sign in')
    expect(page).to have_content('Please sign in')
  end
end
