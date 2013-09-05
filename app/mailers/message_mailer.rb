class MessageMailer < ActionMailer::Base
  def initial_message(brand, message)
    @brand = brand
    @message = message

    mail(from: "OmmYo! <#{@brand.id}_#{@message.omm.id}@mailer.ommyo.com>",
         to: "#{@brand.name} <#{@brand.email}>", subject: "You've been Omm'd!")
    end
  end
end
