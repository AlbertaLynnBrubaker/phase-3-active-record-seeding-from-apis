puts "Seeding spells..."
# these are the spells we want to add to the database
response = RestClient.get "https://www.dnd5eapi.co/api/spells"
spells = JSON.parse(response)


# iterate over each spell
spells["results"].each do |spell|
  spell_response = RestClient.get "https://www.dnd5eapi.co#{spell["url"]}"
  new_spell = JSON.parse(spell_response)


  Spell.create(
    name: new_spell["name"],
    level: new_spell["level"],
    description: new_spell["desc"][0]
  )
end

puts "Done seeding!"