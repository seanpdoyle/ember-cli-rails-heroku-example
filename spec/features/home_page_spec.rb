describe 'the home page', type: :feature, js: true do
  it 'loads the home page' do
    visit '/'
    expect(page).to have_content 'Welcome'
  end
end
