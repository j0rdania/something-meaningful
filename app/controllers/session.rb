require "net/http"
require "uri"

require "sinatra"
require "sinatra/json"

get '/' do
  # get random quote from database
  quote_to_use = Quote.all.sample
  puts quote_to_use.quotation_text
  quote_to_use = quote_to_use.quotation_text.gsub(' ','%20')
  puts 'quote to use after blanks subbed to follow'
  puts quote_to_use
  #convert quote of day to cow say
  quote_to_cowify = "http://cowsay.morecode.org/say?message=#{quote_to_use}&format=html"
  puts 'quote to cowify to follow'
  puts quote_to_cowify
  uri = URI.parse(quote_to_cowify)
  puts 'uri to follow'
  p uri
  req = Net::HTTP::Get.new(uri.to_s)
  puts 'req to follow'
  p req
  response = Net::HTTP.get_response(uri)
  puts 'response to follow'
  p response
  body = Net::HTTP.get(uri)
  puts 'body to follow'
  p body
  @cow_quote = body

  # get current weather at Bull Frog station
  weather_request = 'http://wsdot.com/Traffic/api/WeatherInformation/WeatherInformationREST.svc/GetCurrentWeatherInformationByStationIDAsJson?AccessCode=50bf2668-84ee-4983-bc54-f6dae3a5a31d&StationID=3002'
  uri = URI.parse(weather_request)
  request = Net::HTTP::Get.new(uri.to_s)
  response = Net::HTTP.get_response(uri)
  body = Net::HTTP.get(uri)
  result = JSON.parse(body)
  @station_name= result['StationName']
  @temp = result['TemperatureInFahrenheit']
  @cow_weather = "Temperature in #{@station_name}: #{@temp} degrees Farenheit.  Woohoo! What a lovely day!"
  @cow_weather = @cow_weather.gsub(' ','%20')

  #convert weather report to cow say
  weather_to_cowify = "http://cowsay.morecode.org/say?message=#{@cow_weather}&format=html"
  uri = URI.parse(weather_to_cowify)
  req = Net::HTTP::Get.new(uri.to_s)
  response = Net::HTTP.get_response(uri)
  body = Net::HTTP.get(uri)
  @cow_weather = body
  erb :'/index'
end
