Gem::Specification.new do |s|
  s.name        =  'citesight'
  s.version     =  '0.0.1'
  s.executables << 'citations'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-rg'
  s.add_runtime_dependency 'pp'
  s.date        =  '2014-05-27'
  s.summary     =  'Citation extractor and analyzer'
  s.description =  'Extract and analyze citations from APA style paper'
  s.authors     =  ['Soumya Ray']
  s.email       =  'soumya.ray@gmail.com'
  s.files       =  ["lib/citations.rb"]
  s.homepage    =  'https://github.com/soumyaray/citesight'
  s.license     =  'MIT'
end
