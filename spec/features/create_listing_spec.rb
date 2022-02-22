feature 'create listing' do
  scenario 'user can create a new listing' do
    visit('/')
    click_button('Host')
    visit('/new-listing')
    fill_in 'name', with: 'Woodland Cottage'
    attach_file('Woodland Cottage', './public/images/woodland_cottage.jpg')
    click_button('Submit')

    expect(page).to have_content 'Woodland Cottage'
    # expect(page).to have_content './public/images'
  end
end