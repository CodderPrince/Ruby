require 'open-uri'
require 'json'

class WeatherApp
  API_KEY = "your_api_key_here"  # You can get a free API key from OpenWeatherMap

  def get_weather(city)
    url = "http://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{API_KEY}&units=metric"
    response = URI.open(url).read
    data = JSON.parse(response)

    if data["cod"] == 200
      temperature = data["main"]["temp"]
      description = data["weather"][0]["description"]
      humidity = data["main"]["humidity"]

      puts "Current weather in #{city.capitalize}:"
      puts "Temperature: #{temperature}°C"
      puts "Description: #{description}"
      puts "Humidity: #{humidity}%"
    else
      puts "City not found!"
    end
  end
end

# Example usage:
weather = WeatherApp.new
puts "Enter city name:"
city = gets.chomp
weather.get_weather(city)
