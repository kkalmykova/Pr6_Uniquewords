#n is number of characters in string, k is number of words
def word_frequencies(string, n)
  words = string.downcase.gsub(/[^ \'\w\s]|\p{Punct}{2,}|[\']\s/, "").split  # O(n)
  max = 0
  min = Float::INFINITY

  frequencies = words.inject(Hash.new(0)) do |hash,word|  # O(k)
    occurrences = hash[word] += 1
    max = occurrences if occurrences > max
    min = occurrences if occurrences < min
    hash;
  end

  #perform a counting sort
  sorted = Array.new(max + words.length)

  frequencies.each do |word, frequency|   #O(k)
    p word + " = " + frequency.to_s
    index = frequency
    if sorted[index]
      sorted[index] = sorted[index].push(word)
    else
      sorted[index] = [word]
    end
  end

  if (max < 2)
    puts("\nText has no unique words")
    abort
  else
    puts("\nTop of unique words")
  end

  return sorted.compact.flatten[-n..-1].reverse
end

text = "you're So art deco, out on the floor f'loor"
print word_frequencies(text, 3)
