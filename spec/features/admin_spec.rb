require 'rails_helper'

describe 'viewing admin pages', type: :feature, js: true do
  it 'loads the admin page' do
    visit '/admin' # this loads the ember app
    Percy::Capybara.snapshot(page)

    expect(page).to have_content 'Welcome to Ember'
  end
end
