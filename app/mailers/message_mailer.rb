class MessageMailer < ActionMailer::Base
  def initial_message(brand, message)
    @brand = brand
    @message = message

    mail(from: "OmmYo! <#{ EmailIdentifier.assemble(@brand, @message) }>",
         to: "#{@brand.name} <#{@message.omm.brand_email or @brand.email}>", subject: "You've been Omm'd!")
  end
end
