# frozen_string_literal: true

DOWNCASE_LOWER_RANGE = 97
DOWNCASE_UPPER_RANGE = 122
UPCASE_LOWER_RANGE = 65
UPCASE_UPPER_RANGE = 90
SHIFT_TO_BASE_VALUE = 26

# predicate method to check if a character is an alphabet
def alphabet_range?(value)
  value = value.ord unless value.is_a? Integer
  value.between?(DOWNCASE_LOWER_RANGE, DOWNCASE_UPPER_RANGE) or value.between?(UPCASE_LOWER_RANGE, UPCASE_UPPER_RANGE)
end

def caesar_cipher_helper(character, key)
  # Check if the character is between lower case and upper case
  if alphabet_range?(character)
    alphabet_range?(character.ord + key) ? (character.ord + key).chr : (character.ord - SHIFT_TO_BASE_VALUE + key).chr
  # return character if it isnt an alphabet
  else
    character
  end
end

def caesar_cipher(string, key)
  # return same string if key is 0 or less than 0
  return string if key <= 0

  # split the string into an array, then call the map function to each element and finally join it back into a string
  encrypted_string = string.split('').map { |character| caesar_cipher_helper(character, key) }.join('')
  puts encrypted_string
  encrypted_string
end

caesar_cipher('What a string!', 5)
