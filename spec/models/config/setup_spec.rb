require 'spec_helper'

describe ActsAsUser do
  let(:acts_as_user) { ActsAsUser }
  subject { acts_as_user }
  it { should respond_to :ignored_attributes }
  it { should respond_to :setup }
  it { should respond_to :models_acting_as_users }

  describe 'ignored attributes' do
    context 'when devise is present' do
      it 'adds the devise fields to ignore' do
        acts_as_user.should_receive(:devise?).and_return(true)
        acts_as_user.add_devise_attributes_to_ignore
        acts_as_user.ignored_attributes.should include 'password'
      end
    end
  end
end
