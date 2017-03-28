Rails.application.config.middleware.use OmniAuth::Builder do
 provider :facebook, ENV['facebook_key'], ENV['facebook_key_secret'] # scope: "user_birthday", info_fields: "birthday"
end