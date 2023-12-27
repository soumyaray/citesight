$:.push File.expand_path("../lib", __FILE__)
require 'citesight/version'

Gem::Specification.new do |s|
  s.name        =  'citesight'
  s.version     =  CiteSight::VERSION
  s.date        =  CiteSight::DATE

  s.executables << 'citesight'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-rg'

  s.summary     =  'Citation extractor and analyzer'
  s.description =  'Extract and analyze citations from MISQ and APA style text'
  s.authors     =  ['Soumya Ray']
  s.email       =  'soumya.ray@gmail.com'

  s.files       =  `git ls-files`.split("\n")
  s.test_files  =  `git ls-files -- {test,spec,features}/*`.split("\n")

  s.homepage    =  'https://github.com/soumyaray/citesight'
  s.license     =  'MIT'
end
