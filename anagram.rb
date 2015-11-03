require_relative 'reverse_letters'

def self.find_anagrams(string)
	letters = string.split(//)

	anagrams = []	

	letters.each do |letter|
		remaining = letters.select { |l| l != letter }

		anagrams << letter + remaining.join('')
		anagrams << letter + reverse_letters(remaining).join('')
	end

	anagrams
end