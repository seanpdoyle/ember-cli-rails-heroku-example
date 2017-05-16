require 'rails_helper'

describe 'the home page', type: :feature, js: true do
  it 'loads the home page' do
    visit '/' # this loads the ember app
    Percy::Capybara.snapshot(page)

    expect(page).to have_content 'Welcome'
  end
end
