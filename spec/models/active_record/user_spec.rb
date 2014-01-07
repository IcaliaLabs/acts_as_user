require 'spec_helper'

describe User do
  it { should belong_to :userable }
  it { should respond_to :userable_type }
  it { should respond_to :userable_id }
end
