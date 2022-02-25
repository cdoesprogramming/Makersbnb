feature 'Create a listing' do
  scenario 'User can create a new listing' do
    Listing.create(name: 'Woodland Cottage', description: 'Idyllic cottage surrounded by nature', price: '£100pn')
    Listing.create(name: 'Country Manor', description: 'Stunning two acre manor', price: '£250pn')
    Listing.create(name: 'Hyde Park Penthouse', description: 'Luxurious penthouse appartment in the heart of London', price: '£400pn')

    visit '/listings'

    expect(page).to have_content ('Woodland Cottage')
    expect(page).to have_content ('Idyllic cottage surrounded by nature')
    expect(page).to have_content ('£100pn')
  end
end

