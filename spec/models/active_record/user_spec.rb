require 'spec_helper'

describe User do
  it { should belong_to :userable }
  it { should respond_to :userable_type }
  it { should respond_to :userable_id }
  it { should respond_to :customer? }
  it { should respond_to :admin? }


  describe '#customer?' do
    context 'when is a customer' do
      before do
        @customer_user = Customer.create email: 'test@icalialabs.com'
        @current_user = @customer_user.user
      end
      it 'returns true' do
        expect(@current_user).to be_customer
      end
    end
    context 'when is not customer' do
      before do
        @fake_customer_user = Admin.create email: 'test@icalialabs.com'
        @current_user = @fake_customer_user.user
      end
      it 'returns false' do
        expect(@current_user).not_to be_customer 
      end
    end
    context 'when is an admin' do
      before do
        @admin_user = Admin.create email: 'test@icalialabs.com'
        @current_user = @admin_user.user
      end
      it 'returns true' do
        expect(@current_user).to be_admin
      end
    end
  end
end
