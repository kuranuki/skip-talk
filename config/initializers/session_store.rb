# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_skip-talk_session',
  :secret      => 'e81485865d5384cdcd412dccb23079c64ba94c7eebc52ef04924806506beb0d57549629a92c90f71521fdedc500909e168e33ac7b4db31bb8df605ad23043ad5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
