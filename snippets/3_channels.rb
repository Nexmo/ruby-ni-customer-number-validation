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
  number:  "020 3198 0560",
  country: 'GB'
)

p insight.current_carrier
