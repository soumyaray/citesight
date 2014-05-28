require 'minitest/autorun'
require 'minitest/rg'
require './spec/minitest_helper.rb'

describe 'Paper', 'A text document' do

  describe 'when the paper exists' do

    before do
      contents = File.open('./spec/testfiles/test.txt', 'r').read
      @results = PaperCitations.unique_cites(contents)
    end

    it 'has found the right citations' do
      @results.must_equal TEST_TXT_RESULTS
    end

  end
end
