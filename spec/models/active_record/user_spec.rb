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
        @current_user.should be_customer 
      end
    end
    context 'when is not customer' do
      before do
        @fake_customer_user = Admin.create email: 'test@icalialabs.com'
        @current_user = @fake_customer_user.user
      end
      it 'returns false' do
        @current_user.should_not be_customer 
      end
    end
  end
end
