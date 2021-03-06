require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
people = [ [ "bubba@bubs.com", "1234abcd", "bubbly" ], [ "sparky@sparks.com",
  "2345bcde", "sparkly" ] ]

qs = [
[ "15th-century sculptor Lorenzo Ghiberti's bronze door panels called
  'The Gates of Paradise' are located in which artistic city?", "Florence", %w(Vienna
  Arles Rome) ],
[ "In what country is the 2000-year old style of decorating fabric known as
  'batik' considered a national art form?", "Indonesia", %w(Philippines Mallorca
  Malaysia) ],
[ "What is the middle name of Louis Tiffany (February 18, 1848 – January 17, 1933),
  an American artist best known for his work in stained glass?", "Comfort",
  %w(Philip Henry Joy) ],
[ "Who painted the portrait of George Washington reproduced on the U.S. penny?",
  "Gilbert Stuart", [ "Joseph Steward", "Thomas Birch", "John Mare" ] ],
[ "The legend of Robin Hood first appeared in British literature in what
  year?", "1375", %w(1275 1475 1575) ],
[ "Which country of the world has five million inhabitants and almost two million
  saunas?", "Finland", %w(Sweden Denmark Norway) ],
[ "Which is the deepest of the Great Lakes?", "Lake Superior", [ "Lake Erie",
  "Lake Huron", "Lake Michigan" ] ],
[ "Which country of the world has the largest population - around 130 million-
  of Catholics?", "Brazil", %w(Italy Mexico USA) ],
[ "What do the cities of Atlanta, United States, and Tbilisi,
  (former) Soviet Union, have in common?", "Both are the capital of Georgia.",
  [ "Both are located at 33 degrees N. latitude.",
    "Both are home to 127 chapels of Christian denomination.",
    "Both are large regional producers of cabbage." ] ],
[ "Extending almost 2800 km (1700 miles), the Darling River is the
  longest river of what country?", "Australia", %w(Scotland Finland Canada) ],
[ "What is the smallest member (by population) of the United Nations?",
  "Tuvalo", %w(Monaco Malta Liechtenstein) ],
[ "What is the smallest member (by land area) of the United Nations?",
  "Monaco", %w(Nauru Malta Liechtenstein) ],
[ "While under the patronage of Lorenzo de Medici at the Ducal Palace,
  Michelangelo was struck in the face and disfigured for life. What is the name
  of the fellow sculptor who struck him?", "Torregiano",
  %w(Cellini Vasari Pontormo) ],
 [ "How many times has the Mona Lisa been stolen?", "1", %w( 3 4 5) ],
[ "According to the San Francisco Department of Animal Care and Control, what
  is the most commonly reported wild animal sighted by people in the streets of
  San Francisco?", "racoon", %w(opossum rat squirrel) ],
[ "What animal is most commonly mentioned in the old testament?", "sheep",
  %w(ass goat swine) ],
[ "Cows have sweat glands in what part of their bodies?", "nose",
  %w(tongue haunch forelock) ],
[ "How many murders can positively be credited to Jack the Ripper?", "5",
  %w(3 6 7) ],
[ "The eastern end of the earth is called the Orient. What is the
  western end called?", "occident", %w(anemoi chalcedon arrident) ],
[ "In America it's called the radio antenna. What do Britons call it?", "aerial",
  %w(wire tenny receiver) ]
  ]
qs.each do |qs_attrs|
  body, answer, options = qs_attrs
  Question.create!(body: body, answer: answer, options: options)
end

people.each do |people_attrs|
  email, password, handle = people_attrs
  User.create!(email: email, password: password, password_confirmation: password,
  handle: handle)
end

raw_data = File.read("#{Rails.root}/db/questions.json")
parsed_data = JSON.parse(raw_data)

def get_answer(q_hash)
  correct_index = q_hash["q_correct_option"]
  key_name = "q_options_#{correct_index}"
  answer = q_hash[key_name]
end

def make_options_hash(q_hash)
  [ q_hash["q_options_1"], q_hash["q_options_2"], q_hash["q_options_3"],
    q_hash["q_options_4"] ] - [ get_answer(q_hash) ]
end

parsed_data.each do |q_hash|
  body, answer, options = [ q_hash["q_text"],
                            get_answer(q_hash),
                            make_options_hash(q_hash) ]
  Question.create!(body: body, answer: answer, options: options)
end
