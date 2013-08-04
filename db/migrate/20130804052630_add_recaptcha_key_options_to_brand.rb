class AddRecaptchaKeyOptionsToBrand < ActiveRecord::Migration
  def up
    change_column :brands, :recaptcha_public_key, :string, default: "", null: false
  end

  def down
    change_column :brands, :recaptcha_public_key, :string, default: nil, null: true
  end
end
