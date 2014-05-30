require 'json'
require './lib/citesight.rb'

TEST_CONTENTS = File.open('./spec/testfiles/test.txt', 'r').read

TEST_TXT_RESULTS =
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
    "Charlton 2002" => [47],
    "Griffiths 2000" => [104, 350],
    "Peters et al. 2007" => [148, 187, 231, 492, 512],
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

TEST_CASES = File.open('./spec/testfiles/test_cases.json', 'r') do |f|
  JSON.load(f)
end
