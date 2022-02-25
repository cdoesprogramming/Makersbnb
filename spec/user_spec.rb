require_relative '../lib/user'
require_relative 'setup_test_database'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a user' do
      connection = PG.connect(dbname: 'makersbnb_manager_test')
      user_one = User.create(name: 'Alice Johnson', email: 'AliceJohnson@gmail.com', password: '1234')
      persisted_data_user = persisted_data_user(id: user_one.id)
      expect(user_one).to be_a User
      expect(user_one.id).to eq persisted_data_user.first['id']
      expect(user_one.name).to eq 'Alice Johnson'
    end
  end

  describe '.find' do
    it 'finds/validate a user' do
      connection = PG.connect(dbname: 'makersbnb_manager_test')
      user_one = User.create(name: 'Alice Johnson', email: 'AliceJohnson@gmail.com', password: '1234')
      user_two = User.find(email: 'AliceJohnson@gmail.com', password: '1234')
      expect(user_two).to be_a User
      expect(user_one.name).to eq user_two.name
    end
  end
end
