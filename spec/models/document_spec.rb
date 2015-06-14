require 'rails_helper'

RSpec.describe Document, type: :model do
  it 'has a valid factory' do
    expect(build(:document)).to be_valid
  end
  it 'is invalid without title' do
    expect(build(:document, title: nil)).to_not be_valid
  end
  it 'is invalid without content' do
    expect(build(:document, content: nil)).to_not be_valid
  end
  describe 'search by word' do
    before :each do
      @doc1 = create(:document,
                     title: 'First Document',
                     content: 'Lorem ipsum dolor dolorem LORem <b>Lorem</b>')
      @doc2 = create(:document,
                     title: 'Second Document',
                     content: 'ipsum dolor dolorem')
      @doc3 = create(:document,
                     title: 'Third Document',
                     content: 'sit amet dolor',
                     user_id: '2')
    end

    context 'matching documents' do
      it 'returns an array of results that match' do
        expect(Document.search("Lorem")).to eq [@doc1, @doc2]
      end
    end
    context 'non-matching documents' do
      it 'omits results that do not match' do
        expect(Document.search("Lorem")).not_to include @doc3
      end
    end
    context 'count word occurences' do
      it 'returns number of occurences of searched word' do
        expect(Document.count_occurences("Lorem")).to eq 3
      end
    end
  end
  it 'is invalid with duplicate title' do
    document = create(:document)
    document = build(:document)
    document.valid?
    expect(document.errors[:title]).to include("has already been taken")
  end
end
