# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth, :token_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.password_length = 8..128
  config.reset_password_within = 6.hours
  config.token_authentication_key = :auth_token
  config.scoped_views = true
  config.sign_out_via = :delete
  config.secret_key = 'f470137264ca5d7109ac45cf7b546ba43f112f69341e15fbe29a879029de27299997465f6d3fe36a345e08ddb737ce81775031ef2a3955e8f281c831afbb095c'
end
