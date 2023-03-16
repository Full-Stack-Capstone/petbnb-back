require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Tom') }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
