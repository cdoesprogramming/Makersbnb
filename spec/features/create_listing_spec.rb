feature 'create listing' do
  scenario 'user can create a new listing' do
    visit('/')
    click_button('Host')
    visit('/listings')
    fill_in ('name'), with: 'Woodland Cottage'
    click_button('Submit')

    expect(page).to have_content 'Makersbnb'
    expect(page).to have_button 'Host'
  end
end


feature 'Create a listing' do
  scenario 'User can create a new listing' do
    Listing.create(name: 'Woodland Cottage', description: 'Idyllic cottage surrounded by nature', price: '£100pn')
    Listing.create(name: 'Country Manor', description: 'Stunning two acre manor', price: '£250pn')
    Listing.create(name: 'Hyde Park Penthouse', description: 'Luxurious penthouse appartment in the heart of London', price: '£400pn')

    visit '/listings'

    expect(page).to have_content ('Woodland Cottage')
    expect(page).to have_content ('Idyllic cottage surrounded by nature')
    expect(page).to have_content ('£100pn')





    # expect(page).to have_content('Country Manor', 'Stunning two acre manor', '£250pn')
    # expect(page).to have_content('Hyde Park Penthouse', 'Luxurious penthouse appartment in the heart of London', '£400pn')
  end
end
    