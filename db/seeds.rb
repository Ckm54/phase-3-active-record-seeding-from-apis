# Add seed data in this file
puts "Seeding spells...."

# spells we want to add to the database
spells = ["acid-arrow", "animal-messenger", "calm-emotions", "charm-person"]

# iterate over each of the spells
spells.each do |spell|
  # make api request for the specific spell
  response = RestClient.get "https://www.dnd5eapi.co/api/spells/#{spell}"
  #  response is in JSON format
  # parse response into a ruby hash
  spell_hash = JSON.parse(response)

  # create a spell in database using data from this hash
  Spell.create(
    name: spell_hash["name"],
    level: spell_hash["level"],
    description: spell_hash["desc"][0]
  )
end


puts "Done seeding!"