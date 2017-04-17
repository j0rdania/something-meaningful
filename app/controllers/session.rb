require "net/http"
require "uri"

require "sinatra"
require "sinatra/json"

get '/' do
  # get random quote from database
  # @quote_to_use = Quote.all.sample
  # @quote_to_use='MOOOOO'

  # # convert random quote to cow say
  # quote_to_cowify = "http://cowsay.morecode.org/say?message=#{@quote_to_use}&format=text"
  # puts 'quote to cowify to follow'
  # p quote_to_cowify
  # uri = URI.parse(quote_to_cowify)
  # puts 'uri to follow'
  # p uri
  # request = Net::HTTP::Get.new(uri.to_s)
  # puts 'request to follow'
  # p request
  # response = Net::HTTP.get_response(uri)
  # puts 'response to follow'
  # p response
  # # response = Net::HTTP.start(uri.host, uri.port) {|http|
  # #   http.request(request)
  # # }
  # @cow_quote = JSON.parse(response)
  # puts '@cow quote to follow'
  # p @cow_quote
# @cow_quote = 'MOOOOOOO'



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
  puts '@cow_weather to follow'
  p @cow_weather

  #convert weather report to cow say
  @cow_weather = 'cold'
  weather_to_cowify = "http://cowsay.morecode.org/say?message=#{@cow_weather}&format=html"
  puts 'weather to cowify to follow'
  puts weather_to_cowify
  uri = URI.parse(weather_to_cowify)
  puts 'uri to follow'
  p uri
  req = Net::HTTP::Get.new(uri.to_s)
  puts 'req to follow'
  p req
  response = Net::HTTP.get_response(uri)
  puts 'response to follow'
  p response
  body = Net::HTTP.get(uri)
  puts 'body before json parse to follow'
  p body
  # result = JSON.parse(body)
  # puts 'result aFTER json parse to follow'
  # p result
  @cow_weather = body
  # res = res.body
  # puts 'res.body to follow'
  # p res.body
  # @cow_weather = JSON.parse(res)
  # puts 'parsed json to follow'
  # p @cow_weather
  erb :'/index'
end

# to be deleted later:
  # @quote = Quote.quotation_text.sample
  # num_quotes = Quote.count
  # all_quotes=
  # Quote.all.sample
  # p all_quotes
  # @quote = all_quotes.find(rand(1...num_quotes))
  # @quote = open('http://cowsay.morecode.org/say?message=hi%20there&format=text')


 # body = "http://cowsay.morecode.org/static/cowsay.png\" />\n  <meta content=\"1013094\" property=\"fb:admins\" /> \n\n  <style>\n    body, input {\n      font-family: helvetica;\n      font-size: 12px;\n    }\n\n    h1 {\n      font-size: 14px;\n    }\n\n    form label {\n      display: block;\n    }\n\n    form textarea {\n      width: 450px;\n\t  height: 80px;\n    }\n\n    .error {\n      color: #f00;\n      font-weight: bold;\n    }\n\n    .footer {\n      border-top: 1px solid #ccc;\n      font-size: 11px;\n      padding-top: 5px;\n    }\n\n    .addthis_toolbox {\n      margin-bottom: 10px;\n    }\n\n    pre.cow {\n      font-size: 18px;\n      margin-left: 40px;\n    }\n\n  </style>\n</head>\n<body>\n<h1><a href=\"./\">MOO!</a></h1>\n\n<pre class=\"cow\">\n  ________\n&lt; hi there &gt;\n  --------\n         \\   ^__^ \n          \\  (oo)\\_______\n             (__)\\       )\\/\\\n                 ||----w |\n                 ||     ||\n    \n</pre>\n\n<script type=\"text/javascript\">\nvar addthis_share = {\n    templates: {\n        twitter: '\\{\\{title\\}\\} \\{\\{url\\}\\}'\n    },\n}\n</script>\n\n"
  # body = body.scan( /<([^>]*)>/).last.first
  # body='hitherelove'

  #  body= body.string_between_markers('hi','love')
  #  body= body.string_between_markers('content=','<!-- AddThis')
  # puts 'body to follow'
  # p body
  # Full
  # http = Net::HTTP.new(uri.host, uri.port)
  # response = http.request(Net::HTTP::Get.new(uri.request_uri))


# uri = URI.parse('http://cowsay.morecode.org/say?message=hi%20there&format=text')
  # puts 'uri to follow'
  # puts uri


# url = URI.parse('http://cowsay.morecode.org/say?message=hi%20there&format=text')
# req = Net::HTTP::Get.new(url.to_s)
# res = Net::HTTP.start(url.host, url.port) {|http|
#   http.request(req)
# }

# require "net/http"
# require "uri"

# uri = URI.parse("http://google.com/")

# # Shortcut
# response = Net::HTTP.get_response(uri)

# # Will print response.body
# Net::HTTP.get_print(uri)

# Full
# http = Net::HTTP.new(uri.host, uri.port)
# response = http.request(Net::HTTP::Get.new(uri.request_uri))

# puts 'response to follow'
# puts response
# @quote = res.body
# puts '@quote to follow'
# puts @quote
