describe Bookmark do
  let(:book) { Bookmark.new }

  it 'should be invalid without url' do
    expect(book).not_to be_valid
  end

  it 'should be invalid without a name' do
    expect(book).not_to be_valid
  end

  it 'should have unique url' do
    expect(book).to have_unique(:url)
  end
end
