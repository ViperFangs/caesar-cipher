# frozen_string_literal: true

# class CaesarCipher
class CaesarCipher
  def encrypt(string, key)
    # return same string if key is equal to or less than 0
    return string if key <= 0

    # split the string into an array, then call the map function to each element and finally join it back into a string
    string.split('').map { |character| encrypt_helper(character, key) }.join('')
  end

  private

  DOWNCASE_LOWER_RANGE = 97
  DOWNCASE_UPPER_RANGE = 122
  UPCASE_LOWER_RANGE = 65
  UPCASE_UPPER_RANGE = 90
  BASE_VALUE = 26

  # predicate method to check if a character is an alphabet
  def alphabet_range?(value)
    value = value.ord unless value.is_a? Integer
    value.between?(DOWNCASE_LOWER_RANGE, DOWNCASE_UPPER_RANGE) ^ value.between?(UPCASE_LOWER_RANGE, UPCASE_UPPER_RANGE)
  end

  def encrypt_helper(character, key)
    # Check if the character is between lower case and upper case
    return character unless alphabet_range?(character)

    key = key % BASE_VALUE
    # if the current character + key is greater than Z then it shifts it back to the base value
    alphabet_range?(character.ord + key) ? (character.ord + key).chr : (character.ord - BASE_VALUE + key).chr
  end
end
