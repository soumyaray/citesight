#citesight
Gem to xtract and report on citations in an academic text
home: [https://github.com/soumyaray/citesight](https://github.com/soumyaray/citesight)

## Usage
This gem may be used as a command line utility or called from code

### CLI:
    citations mydoc.txt

### Code example:
    require 'citesight'
    require 'pp'

    contents = File.open(ARGV[0], 'r').read
    res = PaperCitations.unique_cites(contents)

    puts "\nTotal unique citations: #{res.count}"
    PP.pp(Hash[res])
