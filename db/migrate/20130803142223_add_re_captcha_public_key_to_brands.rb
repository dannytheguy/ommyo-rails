class AddReCaptchaPublicKeyToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :recaptcha_public_key, :string
  end
end
