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

      replacement = replacement.to_s
      replacement.gsub!(' ', '<SP>')

      dynamic_iim.gsub!("<omm#{tag[0]}>#{tag[1]}</yo>", replacement)
    end

    dynamic_iim << "\nURL GOTO=about:blank"

    Soliloquy.new dynamic_iim
  end

  private
    def _omm
      @message.text
    end

    def _subject
      'OmmYo'
    end

    def _addressee
      @brand.name
    end

    def _title
      # TODO
      # either Mr or Ms (capitalized no period)
    end

    def _title_allcaps
      # TODO
      # either MR or MS
    end

    def _title_alllower
      # TODO
      # either mr or ms
    end

    def _gender
      # TODO
      # all lowercase... either male or female
    end

    def _fullname
      # TODO
      # firstname and lastname with a space
    end

    def _firstname
      # TODO
      # firstname
    end

    def _lastname
      # TODO
      # lastname
    end

    def _middlename
      # TODO
      # middlename
    end

    def _middlename_initial
      # TODO
      # first character of the middlename, (capitalized)
    end

    def _email
      EmailIdentifier.assemble(@brand, @message)
    end

    def _address_1
      # TODO
      # housenumber and street name.  No periods (in the case of St. you must write out Street)
    end

    def _address_1_street
      # TODO
      # the street name on its own (required by some forign forms)
    end

    def _address_1_num
      # TODO
      # the house number on its own (required by some forign forms)
    end

    def _address_2
      # TODO
      # second line (this one is not required on a single form)
    end

    def _city
      # TODO
      # city
    end

    def _state
      # TODO
      # state abbreviation (capitalized like PA)
    end

    def _state_lowercase
      # TODO
      # state abbreviation (lowercase like pa)
    end

    def _state_full
      # TODO
      # state written out, first character capitalized (like Pennsylvania)
    end

    def _state_full_caps
      # TODO
      # state written out as above except all caps
    end

    def _zip
      # TODO
      # zip code
    end

    def _zip_underscore
      # TODO
      # zip code written XXXX_X
    end

    def _zip_sp
      # TODO
      # zip code written XXXX<SP>X
    end

    def _country_name
      # TODO
      # this is occasionally required.  If it is, let's just put in USA
    end

    def _7178675309
      # TODO
      # full phone number, just numbers
    end

    def _717
      # TODO
      # area code
    end

    def _867
      # TODO 
      # first part of phone#
    end

    def _5309
      # TODO
      # second part of phone#
    end

    def _530_9
      # TODO
      # second part of phone  # with underscore
    end

    def _DOB_month
      # TODO
      # Date of Birth, month, two digits (ex 08)
    end

    def _DOB_day
      # TODO
      # Date of Birth, day, two digits (ex 08)
    end

    def _DOB_year
      # TODO
      # Date of Birth, year, four digits (ex 1908)
    end

    def _DOB_month_short
      # TODO
      # Date of Birth, month, as is (ex 8)
    end

    def _DOB_day_short
      # TODO
      # Date of Birth, day, as is (ex 8)
    end

    def _DOB_year_short
      # TODO
      # Date of Birth, year, two digits (ex 98)
    end

    def _age
      # TODO
      # the age... could be calculated from DOB, i guess
    end

    def _company
      'OmmYo'
    end

    def _DOT_month
      # TODO
      # Date to Transaction month, two digits (ex 08)
    end

    def _DOT_day
      # TODO
      # Date to Transaction day, two digits (ex 08)
    end

    def _DOT_year
      # TODO
      # Date to Transaction month, four digits (ex 1908)
    end

    def _DOT_month_short
      # TODO
      # Date to Transaction month, as is (ex 8)
    end

    def _DOT_day_short
      # TODO
      # Date to Transaction day, as is (ex 8)
    end

    def _DOT_year_short
      # TODO
      # Date to Transaction month, last two digits (ex 98)
    end

    def _DOT_time_hour
      # TODO
      # Date to Transaction hour, two digits (ex 08)
    end

    def _DOT_time_minute
      # TODO
      # Date to Transaction minute, two digits (ex 08)
    end

    def _DOT_time_hour_short
      # TODO
      # Date to Transaction hour, as is (ex 8)
    end

    def _DOT_time_minute_short
      # TODO
      # Date to Transaction minute, as is (ex 8)
    end

    def _DOT_time_am_pm
      # TODO
      # Date to Transaction AM or PM ... just like that. one or the other.
    end

    def _event_zip
      # TODO
      # zip code of the transaction... for now we probably want to use the default zip but ultimately we want to use the GPS of the omm
    end

    def _event_location
      # TODO
      # location of the transaction... takes any short string.  We probably want to use the default city.
    end

    def _event_state
      # TODO
      # state of the transaction
    end

    def _store_number
      # TODO
      # store number
    end

    def _order_num
      # TODO
      # order number
    end

    def _member_num
      # TODO
      # member number
    end

    def _flight_num
      # TODO
      # airlines only.  the flight number if we ever take this info.
    end

    def _product_name
      # TODO
      # the name of the product or service
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
