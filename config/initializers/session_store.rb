# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_blogkai_session',
  :secret      => '6503f84bf2a1083c53d111b1966992f5fbd3b2889fbf21d38f48c57d91f1695fcf7670f2bdc93a2146b6dca294e0aba2c3826c8c1704696f34358b7090d02e7a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
