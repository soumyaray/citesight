require 'minitest/autorun'
require 'minitest/rg'
require './spec/spec_helper.rb'

describe 'Paper', 'A text document' do

  describe 'when there are citations in the text' do
    TEST_RESULTS.each do |cite, count|
      it "should find the right citation count for #{cite}" do
        _(TEST_CITES[cite]).must_equal count
      end
    end
  end

  describe 'when there are no citations to be found' do
    it 'should return an empty hash' do
      no_cites_txt = 'these are not the citations you are looking for'
      _(CiteSight::PaperCitations.new(no_cites_txt).unique_cites.any?)
        .must_equal(false)
    end
  end
end

describe 'Cases', 'Test different citation cases' do
  TEST_CASES.keys.each do |k|
    it "can detect #{k}" do
      _(CiteSight::PaperCitations.new(TEST_CASES[k]["case"]).unique_cites.to_a)
        .must_equal(TEST_CASES[k]["result"])
    end
  end
end

describe 'Indexes', 'Accurately find index of different citations' do
  TEST_CITES.map do |cite, _count|
    it "can find the right index for #{cite}" do
        _(TEST_INDEXES[cite]).must_equal \
          CiteSight::PaperCitations.new(TEST_CONTENTS).index_of_cite(cite)
    end
  end
end
