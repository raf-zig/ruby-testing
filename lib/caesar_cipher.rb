# frozen_string_literal: true

# A Caesar cipher is a type of substitution cipher in which each letter in the plaintext
# is replaced by a letter  some fixed number of positions down the alphabet
def ceaser_cipher(string, key)
  resulting_array = []
  alphabet = ('a'..'z').to_a
  entrance_array = string.downcase.split('')
  entrance_array.each do |x|
    resulting_array << if alphabet.include?(x)
                         alphabet[alphabet.index(x) - 26 + key]
                       else
                         x
                       end
  end
  resulting_array.join
end
# print ceaser_cipher('She looked around for another entrance but saw none', 3)
