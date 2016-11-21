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

# Perform a  Number Insight
# basic inquiry
insight = nexmo.get_number_insight(
  number:  "020 3198 0560",
  country: 'GB'
)

sms_pricing   = nexmo.get_sms_pricing(
  insight['international_format_number'])
voice_pricing = nexmo.get_voice_pricing(
  insight['international_format_number'])

# We use AwesomePrint to
# pretty print the API
# response
require 'awesome_print'
ap [sms_pricing, voice_pricing]
