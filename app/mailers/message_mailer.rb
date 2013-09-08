class MessageMailer < ActionMailer::Base
  def initial_message(brand, message)
    @brand = brand
    @message = message

    mail(from: "OmmYo! <#{ EmailIdentifier.assemble(@brand, @message) }>",
         to: "#{@brand.name} <#{@brand.email}>", subject: "You've been Omm'd!")
  end
end
