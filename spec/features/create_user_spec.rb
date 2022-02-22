feature 'create user' do
  scenario 'User can register' do
    visit('/')
    fill_in 'newname', with: 'Sally Johnson'
    fill_in 'newemail', with: 'slallyj@gmail.com'
    fill_in 'newpassword', with: 'Woodlandcottage'
    click_button('Register')
    expect(page).to have_content 'slallyj@gmail.com'
  end
 end
