require_relative 'reverse_letters'

def find_anagram(word)
	length = word.length
	word = word.split("")

	anagram = []	

	word.each_with_index do |letters, index|
		remaining_letters = word.select {|l| l != letters}
		anagram << letters + remaining_letters.join

		anagram << letters + reverse_letters(remaining_letters).join
	end

	anagram
end