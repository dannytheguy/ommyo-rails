class Romeo
  def outgoing_message(brand, message)
    @brand = brand
    @message = message

    soliloquize
  end

  def soliloquize
    dynamic_iim = @brand.iim.dup

    @brand.iim.scan(/<omm(OP)?>(.+?)<\/yo>/) do |tag|
      method = "_#{tag[1]}" # Because some of our tags start with a number, something Ruby methods can't do :(
      method_op = "#{method}_OP"

      replacement = if tag[0] == "OP" && respond_to?(method_op, true)
                      send method_op
                    elsif respond_to?(method, true)
                      send method
                    end

      dynamic_iim.gsub!("<omm#{tag[0]}>#{tag[1]}</yo>", replacement.to_s)
    end

    dynamic_iim << "\nURL GOTO=about:blank"

    Soliloquy.new dynamic_iim
  end

  private
    def _firstname
      @message.author.name
    end

    def _lastname
      'OmmYo'
    end

    def _subject
      'OmmYo'
    end

    def _email
      "#{@brand.id}_#{@message.omm.id}@mailer.ommyo.com"
    end

    def _7178675309
      '7178675309'
    end

    def _omm
      @message.text
    end

    def _fullname
      'Drew'
    end

  class Soliloquy
    def initialize(iim)
      @base64 = Base64.strict_encode64(iim)
    end

    def deliver
      Faraday.post 'http://23.21.58.232:7977/run_macro', { base64: @base64 }
    end
  end
end
