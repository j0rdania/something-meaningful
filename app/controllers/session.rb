require "net/http"
require "uri"

require "sinatra"
require "sinatra/json"

get '/' do
  # get random quote from database
  quote_to_use = Quote.all.sample
  quote_to_use = quote_to_use.quotation_text.gsub(' ','%20')
  #convert quote of day to cow say
  quote_to_cowify = "http://cowsay.morecode.org/say?message=#{quote_to_use}&format=html"
  uri = URI.parse(quote_to_cowify)
  req = Net::HTTP::Get.new(uri.to_s)
  response = Net::HTTP.get_response(uri)
  body = Net::HTTP.get(uri)
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

def cowify(string_to_cowify,html_or_text)
  string_to_cowify = string_to_cowify.gsub(' ','%20')
  string_to_cowify = "http://cowsay.morecode.org/say?message=#{string_to_cowify}&format=#{html_or_text}"
  uri = URI.parse(string_to_cowify)
  req = Net::HTTP::Get.new(uri.to_s)
  response = Net::HTTP.get_response(uri)
  body = Net::HTTP.get(uri)
  return body
end

