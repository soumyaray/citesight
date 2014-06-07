#citesight
[![Gem Version](https://badge.fury.io/rb/citesight.svg)](http://badge.fury.io/rb/citesight)
[![Build Status](https://travis-ci.org/soumyaray/citesight.svg?branch=master)](https://travis-ci.org/soumyaray/citesight)

home: [https://github.com/soumyaray/citesight](https://github.com/soumyaray/citesight)
Gem to extract and report on citations in an academic text

## Usage
This gem may be used as a command line utility or called from code

### CLI:
    citesight mydoc.txt

### Code example:
    require 'citesight'
    require 'pp'

    contents = File.read("spec/testfiles/large_test.txt", :encoding => "UTF-8")
    cites = PaperCitations.unique_cites(contents)

    puts "\nTotal unique citations: #{cites.count}"
    PP.pp(Hash[cites])

    top_cite = cites.sort_by { |_c, count| count}.reverse.first[0]
    puts "\nYour top citation: #{top_cite}"

    top_cite_indexes = PaperCitations.index_of_cite(contents, top_cite)
    puts "It was cited at locations: #{top_cite_indexes.join(', ')}"
