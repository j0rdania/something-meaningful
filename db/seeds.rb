

Quote.destroy_all
quotes_to_use = ['Eat Kale','Pushups are your friend','Situps are the secret to happiness','Remember to giggle','Turn that frown upside down']
quotes_to_use.each do |quote_to_use|
  new_quote = Quote.create!(quotation_text: quote_to_use)
end
