require_relative '../caesar_cipher'

describe CaesarCipher do
  describe '#encrypt' do
    it 'Encrypts a string' do
      encrypted = CaesarCipher.new.encrypt('What a string!', 5)
      expect(encrypted).to eql 'Bmfy f xywnsl!'
    end

    it 'Encrypts a string' do
      encrypted = CaesarCipher.new.encrypt('What', 4)
      expect(encrypted).to eql 'Alex'
    end

    it 'Returns same string if key is 0' do
      encrypted = CaesarCipher.new.encrypt('Hello World', 0)
      expect(encrypted).to eql 'Hello World'
    end

    it 'Doesn\'t cross the upper case threshold' do
      encrypted = CaesarCipher.new.encrypt('Z', 1)
      expect(encrypted).to eql 'A'
    end

    it 'Doesn\'t cross the lower case threshold' do
      encrypted = CaesarCipher.new.encrypt('z', 1)
      expect(encrypted).to eql 'a'
    end

    it 'Doesn\'t change punctuation letter' do
      encrypted = CaesarCipher.new.encrypt('!@#$%^&*()', 5)
      expect(encrypted).to eql '!@#$%^&*()'
    end

    it 'Works with a large key' do
      encrypted = CaesarCipher.new.encrypt('Hello', 78)
      expect(encrypted).to eql 'Hello'
    end

    it 'Works with all uppercase letters' do
      encrypted = CaesarCipher.new.encrypt('HELLO', 26)
      expect(encrypted).to eql 'HELLO'
    end

    it 'Works with all lowercase letters' do
      encrypted = CaesarCipher.new.encrypt('hello', 52)
      expect(encrypted).to eql 'hello'
    end
  end
end
