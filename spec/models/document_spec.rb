require 'rails_helper'

RSpec.describe Document, :type => :model do
  it 'has a valid factory' do
    expect(build(:document)).to be_valid
  end
  it 'is invalid without title' do
  	expect(build(:document, title: nil)).to_not be_valid
  end
  it 'is invalid without content' do
  	expect(build(:document, content: nil)).to_not be_valid
  end
end
