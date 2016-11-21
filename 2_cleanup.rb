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
insight = nexmo.get_basic_number_insight(
  number:  "020 3198 0560",
  country: 'GB'
)

# We use AwesomePrint to
# pretty print the API
# response
require 'awesome_print'
ap insight
