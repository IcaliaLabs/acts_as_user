require 'spec_helper'

describe Partner do
  it { should have_many(:users).dependent(:destroy) }
  it { should respond_to :users }
  it { should respond_to :name }
  it { should accept_nested_attributes_for(:users).allow_destroy(true) }

  describe 'partner with many users' do
    let(:partner) { Partner.create(name: 'Company', users: users) }
    let(:users)   { Array.new(2) { User.create(email: 'test@icalialabs.com') } }

    it 'gives back all users on partner' do
      partner.users.to_a.should =~ users
    end
  end

  describe 'users autobuild' do
    let(:partner) { Partner.new }

    it 'has to have a user already' do
      partner.users.first.should be_an_instance_of User
    end
  end
end
