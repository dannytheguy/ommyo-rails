class Brand < ActiveRecord::Base
  has_many :omms, :dependent => :destroy

  validate :recaptcha_public_key_validation

  def recaptcha_public_key_validation
    if recaptcha_public_key.present?
      api_response = Faraday.get 'http://www.google.com/recaptcha/api/challenge', { :k => recaptcha_public_key }
      error = api_response.body.match(/^(?:document.write\('Input error: )(.*)(?:\\n'\);)$/)
      errors.add(:recaptcha_public_key, error[1]) if error
    end
  end

  def recaptcha_challenge_field
    api_response = Faraday.get 'http://www.google.com/recaptcha/api/challenge', { :k => recaptcha_public_key }
    match = api_response.body.match(/^(?:    challenge : ')(.*)(?:',)$/)
    return match[1]
  end
end
