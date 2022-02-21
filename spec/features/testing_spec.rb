feature 'testing' do
  scenario 'testing' do
    visit('/')
    expect(page).to have_content 'Hello, world'
  end
end