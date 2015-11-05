get '/words' do
	@words = Word.all
	erb :"/words/index"
end

post'/words' do
	word = Word.create(text: params[:text])
	redirect "/words/#{word.id}"
end

get '/words/new' do
  @word = Word.new
  erb :"/words/new"
end