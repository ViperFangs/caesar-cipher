def caeser-cipher-helper(character, key)
  
  unless character.downcase == 'z'
    return character.ord + key
  else
    return character.ord - 25 + key
    
end

p trial1 = "What a string!".split("")
p trial2 = trial1.map{|character| caeser-cipher-helper(character, 2)}
p trial3 = trial2.join('')
