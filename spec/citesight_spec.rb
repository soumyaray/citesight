require 'minitest/autorun'
require 'minitest/rg'
require './spec/minitest_helper.rb'

describe 'Paper', 'A text document' do

  describe 'when there are citations in the text' do
    before do
      @results = CiteSight::PaperCitations.unique_cites(TEST_CONTENTS)
    end

    it 'should fine the right citations' do
      _(@results).must_equal TEST_CITES
    end
  end

  describe 'when there are no citations to be found' do
    it 'should return an empty hash' do
      no_cites_txt = 'these are not the citations you are looking for'
      _(CiteSight::PaperCitations.unique_cites(no_cites_txt).any?)
        .must_equal(false)
    end
  end
end

describe 'Cases', 'Test different citation cases' do
  TEST_CASES.keys.each do |k|
    it "can detect #{k}" do
      _(CiteSight::PaperCitations.unique_cites(TEST_CASES[k]["case"]).to_a)
        .must_equal(TEST_CASES[k]["result"])
    end
  end
end

describe 'Indexes', 'Accurately find index of different citations' do
  it "can find the right index for all citations" do
    TEST_CITES.map do |cite, _count|
      _(TEST_INDEXES[cite]).must_equal \
                CiteSight::PaperCitations.index_of_cite(TEST_CONTENTS, cite)
    end
  end
end

## Produce hash of all cite indexes:
# Hash[
#   TEST_CITES.map do |cite, count|
#     [cite, PaperCitations.index_cite(doc, cite)]
#   end
# ]
