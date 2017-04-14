get '/' do
  # @quote = Quote.quotation_text.sample
  num_quotes = Quote.count
  all_quotes=Quote.all
  p all_quotes
  @quote = all_quotes.find(rand(0...num_quotes))
  erb :'/index'
end
