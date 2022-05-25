def caesar_cipher(string, key)

  if key <= 0 
    return string
  end

  string.split("").map {|character| caesar_cipher_helper(character, key)}.join("")

end

def caesar_cipher_helper(character, key)

  if character.ord.between?(97,122)

    unless character.ord + key > 122
      character = character.ord + key
      character = character.chr
    else 
      character = character.ord - 25 + key
      character = character.chr
    end

  elsif character.ord.between?(60,90)

    unless character.ord + key > 90
      character = character.ord + key
      character = character.chr
    else 
      character = character.ord - 26 + key
      character = character.chr
    end

  else 
    character
  end

end



