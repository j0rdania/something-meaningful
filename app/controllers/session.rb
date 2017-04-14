get '/' do
  # later, use API call to get quote of the day
  @quote = 'Turn that frown upside down!'
  erb :'/index'
end
