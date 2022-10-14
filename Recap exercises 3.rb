def no_dupes?(arr)
    new_hash = Hash.new(0)
    new_arr = []
    arr.each do |i|
        new_hash[i] += 1
    end
    new_hash.each do |k,v|
        if v == 1
            new_arr << k
        end
    end
    new_arr   
end

def no_consecutive_repeats?(arr)
    (0...arr.length-1).each do |i|
        if arr[i] == arr[i+1]
            return false
        end
    end
    true
end

def char_indices(str)
    hash = Hash.new{|k, v| k[v] = []}
    str.each_char.with_index do |char, i|
        hash[char] << i
    end
    hash
end

def longest_streak(str)
    current = ""
    longest = ""
    (0...str.length).each do |i|
        if str[i] == str[i-1] || i == 0
            current += str[i]
        else
            current = str[i]
        end

        if current.length > longest.length
            longest = current
        end
    end
    longest
end

def bi_prime?(num)
    primes = []
    (2...num).each do |number|
        if primes(number)
            primes << number
        end
    end
    count = 0
    (0...primes.length).each do |i|
        (0...primes.length).each do |j|
            if primes[i] * primes[j] == num
                count += 1
            end
        end
    end
    if count >=1
        return true
    end
    false
end

def primes(num)
    return false if num < 2
    (2...num).each do |i|
        return false if num % i == 0
    end
    true
end

def vigenere_cipher(message, keys)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    new_str = ""


    message.each_char.with_index do |char, i|
        key = keys[i % keys.length]
        old_index = alphabet.index(char)
        new_index = key + old_index % alphabet.length
        new_char = alphabet[new_index]
        new_str += new_char    
    end
    new_str
end

def vowel_rotate(str)
    vowels_list = []
    vowels = "aeiou"
    new_str = ""

    str.each_char do |char|
        if vowels.include?(char)
            vowels_list << char
        end
    end

    number = vowels_list.length - 1
    str.each_char.with_index do |char, i|
        if vowels.include?(char)
            new_index = (vowels_list.index(char) + number) % vowels_list.length
            new_str += vowels_list[new_index]
        else
            new_str += char
        end
    end
    new_str
end

# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

class String
    def select(&prc)
        prc ||= Proc.new{return ""}
        new_str = ""
        self.each_char do |char|
            if prc.call(char)
                new_str += char
            end
        end
        new_str
    end

    def map!(&prc)
        self.each_char.with_index do |char, i|
            if prc.call(char)
                self[i] = prc.call(char, i)
            else
                self[i]
            end
        end
        self
    end
end

def multiply(a, b)
    return 0 if a == 0 || b == 0

    if b > 0
        a + multiply(a, b-1)
    else
        -a + multiply(a, b+1)
    end
end

def lucas_sequence(num)
    return [] if num == 0
    return [2] if num == 1
    return [2, 1] if num == 2

    sequence = lucas_sequence(num - 1)
    next_ele = sequence[-1] + sequence[-2]
    sequence << next_ele
    sequence

end

def prime_factorization(num)

    (2...num).each do |factor|
        if num % factor == 0
            other_factor = num / factor
            return [*prime_factorization(factor), *prime_factorization(other_factor)]
        end
    end
    return [num]
end

p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]
