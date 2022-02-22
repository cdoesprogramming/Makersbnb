feature 'create listing' do
  scenario 'user can create a new listing' do
    visit('/')
    click_button('Host')
    visit('/listings')
    fill_in ('name'), with: 'Woodland Cottage'
    attach_file('image', './public/images/woodland_cottage.jpg')
    click_button('Submit')

    expect(page).to have_content 'Makersbnb'
    expect(page).to have_button 'Host'
    # expect(page).to have_content './public/images'
  end
end