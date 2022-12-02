OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['3224142121168982'], ENV['721e9e5076e5c6a67a04cf83cd2cea97']
end