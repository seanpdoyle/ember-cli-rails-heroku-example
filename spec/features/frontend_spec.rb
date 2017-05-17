require 'rails_helper'

describe 'viewing frontend pages', type: :feature, js: true do
  it 'loads the home page' do
    visit '/' # this loads the ember app
    Percy::Capybara.snapshot(page)

    expect(page).to have_content 'Welcome to Ember-CLI Rails'
  end
end
