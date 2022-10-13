# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    vowels = "aeiou"
    arr = []

    (0...words.length).each do |i|
        (0...words.length).each do |j|
            if j > i
                word = words[i] + " " + words[j]
                if check_word(word)
                    arr << word
                end
            end
        end
    end
    arr
end

def check_word(word)
    vowels = "aeiou"
    vowels.each_char do |char|
        if !word.include?(char)
            return false
        end
    end
    true
end
# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    count = 0
    (2...num).each do |factor|
        if num % factor == 0
            count +=1
        end
    end
    if count >= 1
        return true
    end
    false
end

# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    bigrams.select do |bigram|
        str.include?(bigram)
    end
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        prc ||= Proc.new{|k,v| k == v}
        new_hash = {}
        self.each do |k, v|
            if prc.call(k, v)
                new_hash[k] = v
            end
        end
        new_hash
    end
end

# hash = {"cat"=>"dog", "purple"=>"purple", "sound"=>"music", "open"=>"open"}
# p hash.my_select

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        new_arr = []
        (0...self.length).each do |i|
            (i...self.length).each do |j|
                new_arr << self[i..j]
            end
        end
        new_arr
        if length == nil
            new_arr
        else
            new_arr.select do |item|
                item.length == length
            end
            
        end

    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alphabet = "abcdefghijklmnopqrstuvwxyz"
        new_str = []
        self.each_char do |char|
            old_index = alphabet.index(char)
            new_index = old_index + num
            new_char = alphabet[new_index % 26]
            new_str << new_char
        end
        new_str.join("")
    end
end
