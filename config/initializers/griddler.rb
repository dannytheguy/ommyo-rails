Griddler.configure do |config|
  config.processor_class = Ommceptionist
  config.email_service = :mandrill
end
