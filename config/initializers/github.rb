Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUN_CLIENT_ID'], ENV['GITHUN_CLIENT_SECRETS']
end