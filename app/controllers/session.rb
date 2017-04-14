get '/' do
  # @quote = Quote.quotation_text.sample
  # num_quotes = Quote.count
  # all_quotes=
  # Quote.all.sample
  # p all_quotes
  # @quote = all_quotes.find(rand(1...num_quotes))
  @quote = Quote.all.sample
  erb :'/index'
end
