require 'open-uri'
require 'json'

class CurrencyConverter
  API_URL = "https://api.exchangerate-api.com/v4/latest/USD"

  def initialize
    @rates = fetch_exchange_rates
  end

  def fetch_exchange_rates
    response = URI.open(API_URL).read
    JSON.parse(response)["rates"]
  end

  def convert(amount, from_currency, to_currency)
    if @rates[from_currency] && @rates[to_currency]
      conversion_rate = @rates[to_currency] / @rates[from_currency]
      converted_amount = amount * conversion_rate
      puts "#{amount} #{from_currency} is equal to #{converted_amount.round(2)} #{to_currency}."
    else
      puts "Invalid currencies."
    end
  end
end

# Example usage:
converter = CurrencyConverter.new

puts "Enter amount:"
amount = gets.chomp.to_f
puts "Enter from currency (e.g., USD, EUR, GBP):"
from_currency = gets.chomp.upcase
puts "Enter to currency (e.g., USD, EUR, GBP):"
to_currency = gets.chomp.upcase

converter.convert(amount, from_currency, to_currency)
