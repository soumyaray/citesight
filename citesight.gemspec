Gem::Specification.new do |s|
  s.name        =  'citesight'
  s.version     =  '0.1.0'
  s.executables << 'citesight'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-rg'
  s.date        =  '2014-05-30'
  s.summary     =  'Citation extractor and analyzer'
  s.description =  'Extract and analyze citations from APA style text'
  s.authors     =  ['Soumya Ray']
  s.email       =  'soumya.ray@gmail.com'
  s.files       =  ["lib/citesight.rb"]
  s.homepage    =  'https://github.com/soumyaray/citesight'
  s.license     =  'MIT'
end
