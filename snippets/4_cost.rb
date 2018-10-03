# Ensure we load all gems from
# the Gemfile
require 'bundler'
Bundler.setup

# Load environment variables
# from the .env file
require 'dotenv'
Dotenv.load

# Initialize nexmo with the
# NEXMO_API_KEY and
# NEXMO_API_SECRET environment
# variables
require 'nexmo'
nexmo = Nexmo::Client.new

# Perform a Number Insight Standard inquiry
insight = nexmo.number_insight.standard(
  number:  '020 3198 0560',
  country: 'GB'
)

# Store the network and country codes
current_network = insight.current_carrier.network_code
current_country = insight.country_code

# Fetch the voice and SMS pricing data for the country
sms_pricing = nexmo.pricing.sms.get(current_country)
voice_pricing = nexmo.pricing.voice.get(current_country)

# Retrieve the network cost from the pricing data
sms_cost = sms_pricing.networks.select{|network| network.network_code == current_network}
voice_cost = voice_pricing.networks.select{|network| network.network_code == current_network}

p({
  sms: sms_cost,
  voice: voice_cost
})
