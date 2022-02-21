# feature 'create listing' do
#   scenario 'user can create a new listing' do
#     visit('/')
#     click_button('Host')
#     visit('/create')
#     fill_in 'name', with: 'Woodland Cottage'
#     attach_file('Image', '/path/to/image.jpg')
#     click_button('Submit')

#     expect(page).to have_content 'Woodland Cottage'
#     expect(page).to have_content './public/images'
#   end
# end