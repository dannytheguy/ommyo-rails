class Message < ActiveRecord::Base
  belongs_to :omm
  validates :omm, presence: true

  belongs_to :author, :polymorphic => true

  default_scope -> { order('created_at ASC') }

  attr_accessor :recaptcha_challenge_field
  attr_accessor :recaptcha_response_field
  validate :recaptcha_presence

  def recaptcha_presence
    if omm.brand.recaptcha_public_key
      if @recaptcha_challenge_field.blank? || @recaptcha_response_field.blank?
        errors.add(:recaptcha_public_key, omm.brand.recaptcha_public_key)
        errors.add(:recaptcha_challenge_field, omm.brand.recaptcha_challenge_field)
      end
    end
  end
end
