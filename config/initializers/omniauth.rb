# Replace API_KEY and API_SECRET with the values you got from Facebook
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "342616889649443", "4ef089ac1a89631a325a664bf66965a4"
end