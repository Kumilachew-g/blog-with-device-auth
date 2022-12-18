require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name, email, and password' do
    user = User.new(
      email: 'hana@gmail.com',
      password: 'hana@gmail.com'
    )
    expect(user).to be_valid
  end

  it 'is invalid without an email address' do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is invalid without a password' do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  context 'email is already taken ' do
    before do
      User.create(
        email: 'hana@gmail.com',
        password: 'hana@gmail.com'
      )
    end

    it 'is invalid with a duplicate email address' do
      user = User.new(
        email: 'hana@gmail.com',
        password: 'hana@gmail.com'
      )
      user.valid?
      expect(user.errors[:email]).to include('has already been taken')
    end
  end
end
