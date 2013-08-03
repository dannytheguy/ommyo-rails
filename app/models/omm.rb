class Omm < ActiveRecord::Base
  belongs_to :user
  belongs_to :brand

  attr_accessor :recaptcha_challenge_field
  attr_accessor :recaptcha_response_field
  validate :recaptcha_presence

  def recaptcha_presence
    if brand.recaptcha_public_key
      if @recaptcha_challenge_field.blank? || @recaptcha_response_field.blank?
        errors.add(:recaptcha_public_key, brand.recaptcha_public_key)
        errors.add(:recaptcha_challenge_field, brand.recaptcha_challenge_field)
      end
    end
  end
end
