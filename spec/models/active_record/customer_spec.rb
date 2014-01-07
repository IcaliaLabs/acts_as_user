require 'spec_helper'

describe Customer do
  it { should have_one(:user).dependent(:destroy) }
  it { should respond_to :user }
  it { should respond_to :email }

  describe 'model valid' do
    before do
      @customer = Customer.new
      @user = User.new
      @customer.user = @user
    end
    it 'throws errors when user has no email is not correct' do
      @customer.should_not be_valid
    end

    it 'is valid when user has no errors' do
      @customer.email = 'test@test.com'
      @customer.should be_valid
    end
  end

  describe 'user autobuild' do
    before do
      @customer = Customer.new
    end

    it 'has to have a user already' do
      @customer.user.should be_present
    end
  end

  describe 'setters' do
    before do
      @customer = Customer.new(email: 'test@test.com')
    end
    it 'saves the user with its corresponding fields' do
      @customer.save
      @customer.user.email.should eql @customer.email
    end
  end
end
