module SubStrings
  def self.substrings(string, dictionary)
    hash = {}
    dictionary
      .each do |word|
        times_found = string
                        .downcase
                        .scan(word)
                        .count
        hash[word] = times_found unless times_found == 0
      end
    hash
  end
end