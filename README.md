#citesight
Gem to extract and report on citations in an academic text
[![Gem Version](https://badge.fury.io/rb/citesight.svg)](http://badge.fury.io/rb/citesight)
[![Build Status](https://travis-ci.org/soumyaray/gentle-scholar.svg)](https://travis-ci.org/soumyaray/citesight)

home: [https://github.com/soumyaray/citesight](https://github.com/soumyaray/citesight)

## Usage
This gem may be used as a command line utility or called from code

### CLI:
    citesight mydoc.txt

### Code example:
    require 'citesight'
    require 'pp'

    contents = File.open(ARGV[0], 'r').read
    res = PaperCitations.unique_cites(contents)

    puts "\nTotal unique citations: #{res.count}"
    PP.pp(Hash[res])
