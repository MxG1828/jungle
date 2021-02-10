require 'rails_helper'


describe 'Validations' do
  
  it 'create new user' do
    @user = User.new(
      :email=>"1@1.com",
      :password=>"123123",
      :password_confirmation=>"123123"
    )
    expect(@user).to be_valid
  end
  it 'must have email' do
    @user = User.new(
      :email=>"",
      :password=>"123123",
      :password_confirmation=>"123123"
    )
    expect(@user).to_not be_valid
  end
  it 'must have password' do
    @user = User.new(
      :email=>"2@2.com",
      :password=>"",
      :password_confirmation=>"123123"
    )
    expect(@user).to_not be_valid
  end
  it 'must have password comfirmation' do
    @user = User.new(
      :email=>"3@3.com",
      :password=>"123123",
      :password_confirmation=>""
    )
    expect(@user).to_not be_valid
  end
  it 'password and comfirmation matches' do
    @user = User.new(
      :email=>"4@4.com",
      :password=>"123123",
      :password_confirmation=>"1231233"
    )
    expect(@user).to_not be_valid
  end
  it 'password must have a minimum length of 6' do
    @user = User.new(
      :email=>"5@5.com",
      :password=>"12312",
      :password_confirmation=>"12312"
    )
    expect(@user).to_not be_valid
  end
  it 'email must be unique' do
    @testuser = User.new(
      :email=>"test@test.com",
      :password=>"123123",
      :password_confirmation=>"123123"
    )
    @testuser.save
    @user = User.new(
      :email=>"test@test.com",
      :password=>"123123",
      :password_confirmation=>"123123"
    )
    expect(@user).to_not be_valid
  end


end
