
feature 'create listing' do
  scenario 'user can create a new listing' do
    visit('/')
    click_button('Host')
    visit('/listings')
    fill_in ('name'), with: 'Woodland Cottage'
    fill_in ('description'), with: 'Idyllic cottage surrounded by nature'
    fill_in ('price'), with: '£100pn'
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

    visit '/'

    expect(page).to have_content ('Woodland Cottage')
    expect(page).to have_content ('Idyllic cottage surrounded by nature')
    expect(page).to have_content ('£100pn')
  end
end

