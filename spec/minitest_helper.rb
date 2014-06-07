require 'json'
require './lib/citesight.rb'

TEST_CONTENTS = File.read('./spec/testfiles/test.txt')

TEST_CITES =
  {
    "Charlton 2002" => 1,
    "Griffiths 2000" => 1,
    "Peters et al. 2007" => 2,
    "Ma and Agarwal 2007" => 1,
    "Hur 2007" => 2,
    "Oreg 1995b" => 1,
    "Ray 2000" => 2,
    "Ma et al. 2002" => 3,
    "Griffins 2000" => 1,
    "O'Hern 2010" => 1,
    "McDonald 2003" => 1,
    "Wa'el et al. 1993" => 1,
    "van der Aalst 2004" => 1,
    "De Boor 1980" => 1
  }

TEST_INDEXES =
  {
    "Charlton 2002"=>[40],
    "Griffiths 2000"=>[97],
    "Peters et al. 2007"=>[219, 500],
    "Ma and Agarwal 2007"=>[174],
    "Hur 2007"=>[146, 490],
    "Oreg 1995b"=>[318],
    "Ray 2000"=>[346, 432],
    "Ma et al. 2002"=>[272, 377, 407],
    "Griffins 2000"=>[522],
    "O'Hern 2010"=>[566],
    "McDonald 2003"=>[634],
    "Wa'el et al. 1993"=>[583],
    "van der Aalst 2004"=>[697],
    "De Boor 1980"=>[729]
  }

TEST_CASES = File.open('./spec/testfiles/test_cases.json', 'r') do |f|
  JSON.load(f)
end
