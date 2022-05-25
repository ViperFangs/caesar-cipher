DOWNCASE_ALPHABET_LOWER_RANGE = 97
DOWNCASE_ALPHABET_UPPER_RANGE = 122
UPCASE_ALPHABET_LOWER_RANGE = 65
UPCASE_ALPHABET_UPPER_RANGE = 90
SHIFT_TO_BASE_VALUE = 26

#predicate method to check if a character is an alphabet
def alphabet_range?(value)

  if value.is_a? Integer
    value.between?(DOWNCASE_ALPHABET_LOWER_RANGE, DOWNCASE_ALPHABET_UPPER_RANGE) or value.between?(UPCASE_ALPHABET_LOWER_RANGE, UPCASE_ALPHABET_UPPER_RANGE)
  else
    value.ord.between?(DOWNCASE_ALPHABET_LOWER_RANGE, DOWNCASE_ALPHABET_UPPER_RANGE) or value.ord.between?(UPCASE_ALPHABET_LOWER_RANGE, UPCASE_ALPHABET_UPPER_RANGE)
  end

end

def caesar_cipher_helper(character, key)
  #Check if the character is between lower case and upper case
  if alphabet_range?(character)
    alphabet_range?(character.ord + key) ? character = (character.ord + key).chr : character = (character.ord - SHIFT_TO_BASE_VALUE + key).chr
  #return character if it isnt an alphabet
  else 
    character
  end

end

def caesar_cipher(string, key)
  #return same string if key is 0 or less than 0
  if key <= 0 
    return string
  end
  #split the string into an array, then call the map function to each element and finally join it back into a string
  string.split("").map {|character| caesar_cipher_helper(character, key)}.join("")

end

