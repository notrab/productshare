Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Rails.application.secrets.twitter_consumer_key, Rails.application.secrets.twitter_consumer_secret
  # Or you could use...
  # provider :facebook, Rails.application.secrets.facebook_app_key, Rails.application.secrets.facebook_app_secret
end
