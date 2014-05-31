require 'minitest/autorun'
require 'minitest/rg'
require './spec/minitest_helper.rb'

describe 'Paper', 'A text document' do

  describe 'when there are citations in the text' do
    before do
      @results = PaperCitations.unique_cites(TEST_CONTENTS)
    end

    it 'should fine the right citations' do
      @results.must_equal TEST_TXT_RESULTS
    end
  end

  describe 'when there are no citations to be found' do
    it 'should return an empty hash' do
      no_cites_txt = 'these are not the citations you are looking for'
      # TODO: check return of empty hash
    end
  end
end

describe 'Cases', 'Test different citation cases' do
  TEST_CASES.keys.each do |k|
    it "can detect #{k}" do
      PaperCitations.unique_cites(TEST_CASES[k]["case"]).to_a\
        .must_equal(TEST_CASES[k]["result"])
    end
  end

end
