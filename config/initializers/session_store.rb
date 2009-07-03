# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_jackhoward_session',
  :secret      => '87b6a41a69a6c6aa43e42ee3de9a29907170f77f0379aac7521c75f72da2ae3026a3f970d74c2745eefad885f162b289165a70a04460936938891e5731f03e23'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
