def three_letters?(input)
	if input.length > 3
		true
	else
		false
	end
end

def distinct_letters?(input)
   letter_array = input.chars
   unique_letters = letter_array.uniq
   if unique_letters.length < letter_array.length
     false
   else
     true
   end
end

def valid_input(input)
  if input.length > 3
     raise Exception.new("Word must be less than or equal to 3 characters.")
  end
end


get '/' do
  erb :index
end

get '/anagrams/:word' do
	@word = params[:word]
	alphabetized_string = @word.chars.sort.join
	@anagrams = Word.where("letters=?", alphabetized_string)
	erb :show
end

post '/' do
    word = params[:word]
    begin 
      valid_input(word)
      redirect "/anagrams/#{word}"
    rescue Exception => error
		@error = "Oops! Something must be wrong. Please make sure you spelled the word correctly."
		erb :index
	end
end

