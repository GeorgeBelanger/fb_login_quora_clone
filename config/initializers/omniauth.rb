Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['294243191101976'], ENV['c25992f1a83164fbd902a7e83ff591a9']
end