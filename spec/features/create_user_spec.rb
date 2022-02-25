feature 'create user' do
  scenario 'User can register' do
    visit('/')
    click_button 'Sign up'
    visit('/createuser')

    fill_in 'newname', with: 'Sally Johnson'
    fill_in 'newemail', with: 'sallyj@gmail.com'
    fill_in 'newpassword', with: 'Woodlandcottage'
    click_button('Register')

    expect(page).to have_content 'Available Spaces'
  end
 end
