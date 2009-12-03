# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_gordo_session',
  :secret      => '561cdf6b35ef880c790c066dc841e150e7d97c95bb9b1de0f3a6f0c14bdf5c5579e988cc1c9d603821afdae6272791c8537953b4d21d3f070e150778bc48e15c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
