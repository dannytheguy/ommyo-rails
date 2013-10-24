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

    def _title_OP
      :delete_line
    end

    def _title
      'Mr'
      # TODO
      # either Mr or Ms (capitalized no period)
    end

    def _title_allcaps_OP
      :delete_line
    end

    def _title_allcaps
      'MR'
      # TODO
      # either MR or MS
    end

    def _title_alllower_OP
      :delete_line
    end

    def _title_alllower
      'mr'
      # TODO
      # either mr or ms
    end

    def _gender_OP
      :delete_line
    end

    def _gender
      'male'
      # TODO
      # all lowercase... either male or female
    end

    def _fullname_OP
      'OmmYo'
    end

    def _fullname
      'OmmYo'
      # TODO
      # firstname and lastname with a space
    end

    def _firstname_OP
      'Omm'
    end

    def _firstname
      'Omm'
      # TODO
      # firstname
    end

    def _lastname_OP
      'Yo'
    end

    def _lastname
      'Yo'
      # TODO
      # lastname
    end

    def _middlename
      :delete_line
      # TODO
      # middlename
    end

    def _middlename_initial
      :delete_line
      # TODO
      # first character of the middlename, (capitalized)
    end

    def _email
      EmailIdentifier.assemble(@brand, @message)
    end

    def _address_1_OP
      :delete_line
    end

    def _address_1
      '123 OmmYo Street'
      # TODO
      # housenumber and street name.  No periods (in the case of St. you must write out Street)
    end

    def _address_1_street_OP
      :delete_line
    end

    def _address_1_street
      'OmmYo Street'
      # TODO
      # the street name on its own (required by some forign forms)
    end

    def _address_1_num_OP
      :delete_line
    end

    def _address_1_num
      '123'
      # TODO
      # the house number on its own (required by some forign forms)
    end

    def _address_2
      :delete_line
      # TODO
      # second line (this one is not required on a single form)
    end

    def _city_OP
      :delete_line
    end

    def _city
      'Harrisburg'
      # TODO
      # city
    end

    def _state_OP
      :delete_line
    end

    def _state
      'PA'
      # TODO
      # state abbreviation (capitalized like PA)
    end

    def _state_lowercase_OP
      :delete_line
    end

    def _state_lowercase
      'pa'
      # TODO
      # state abbreviation (lowercase like pa)
    end

    def _state_full_OP
      :delete_line
    end

    def _state_full
      'Pennsylvania'
      # TODO
      # state written out, first character capitalized (like Pennsylvania)
    end

    def _state_full_caps_OP
      :delete_line
    end

    def _state_full_caps
      'PENNSYLVANIA'
      # TODO
      # state written out as above except all caps
    end

    def _zip_OP
      :delete_line
    end

    def _zip
      '17111'
      # TODO
      # zip code
    end

    def _zip_underscore_OP
      :delete_line
    end

    def _zip_underscore
      '1711_1'
      # TODO
      # zip code written XXXX_X
    end

    def _zip_sp_OP
      :delete_line
    end

    def _zip_sp
      '1711 1'
      # TODO
      # zip code written XXXX<SP>X
    end

    def _country_name_OP
      :delete_line
    end

    def _country_name
      'USA'
      # TODO
      # this is occasionally required.  If it is, let's just put in USA
    end

    def _7178675309_OP
      :delete_line
    end

    def _7178675309
      '7179876543'
      # TODO
      # full phone number, just numbers
    end

    def _717_OP
      :delete_line
    end

    def _717
      '717'
      # TODO
      # area code
    end

    def _867_OP
      :delete_line
    end

    def _867
      '987'
      # TODO 
      # first part of phone#
    end

    def _5309_OP
      :delete_line
    end

    def _5309
      '6543'
      # TODO
      # second part of phone#
    end

    def _530_9_OP
      :delete_line
    end

    def _530_9
      '654_3'
      # TODO
      # second part of phone  # with underscore
    end

    def _DOB_month_OP
      :delete_line
    end

    def _DOB_month
      '01'
      # TODO
      # Date of Birth, month, two digits (ex 08)
    end

    def _DOB_day_OP
      :delete_line
    end

    def _DOB_day
      '01'
      # TODO
      # Date of Birth, day, two digits (ex 08)
    end

    def _DOB_year_OP
      :delete_line
    end

    def _DOB_year
      '1981'
      # TODO
      # Date of Birth, year, four digits (ex 1908)
    end

    def _DOB_month_short_OP
      :delete_line
    end

    def _DOB_month_short
      '1'
      # TODO
      # Date of Birth, month, as is (ex 8)
    end

    def _DOB_day_short_OP
      :delete_line
    end

    def _DOB_day_short
      '1'
      # TODO
      # Date of Birth, day, as is (ex 8)
    end

    def _DOB_year_short_OP
      :delete_line
    end

    def _DOB_year_short
      '81'
      # TODO
      # Date of Birth, year, two digits (ex 98)
    end

    def _age_OP
      :delete_line
    end

    def _age
      '21'
      # TODO
      # the age... could be calculated from DOB, i guess
    end

    def _company
      'OmmYo'
    end

    def _DOT_month_OP
      :delete_line
    end

    def _DOT_month
      '01'
      # TODO
      # Date to Transaction month, two digits (ex 08)
    end

    def _DOT_day_OP
      :delete_line
    end

    def _DOT_day
      '01'
      # TODO
      # Date to Transaction day, two digits (ex 08)
    end

    def _DOT_year_OP
      :delete_line
    end

    def _DOT_year
      '2013'
      # TODO
      # Date to Transaction month, four digits (ex 1908)
    end

    def _DOT_month_short_OP
      :delete_line
    end

    def _DOT_month_short
      '1'
      # TODO
      # Date to Transaction month, as is (ex 8)
    end

    def _DOT_day_short_OP
      :delete_line
    end

    def _DOT_day_short
      '1'
      # TODO
      # Date to Transaction day, as is (ex 8)
    end

    def _DOT_year_short_OP
      :delete_line
    end

    def _DOT_year_short
      '13'
      # TODO
      # Date to Transaction month, last two digits (ex 98)
    end

    def _DOT_time_hour_OP
      :delete_line
    end

    def _DOT_time_hour
      '09'
      # TODO
      # Date to Transaction hour, two digits (ex 08)
    end

    def _DOT_time_minute_OP
      :delete_line
    end

    def _DOT_time_minute
      '00'
      # TODO
      # Date to Transaction minute, two digits (ex 08)
    end

    def _DOT_time_hour_short_OP
      :delete_line
    end

    def _DOT_time_hour_short
      '9'
      # TODO
      # Date to Transaction hour, as is (ex 8)
    end

    def _DOT_time_minute_short_OP
      :delete_line
    end

    def _DOT_time_minute_short
      '0'
      # TODO
      # Date to Transaction minute, as is (ex 8)
    end

    def _DOT_time_am_pm_OP
      :delete_line
    end

    def _DOT_time_am_pm
      'AM'
      # TODO
      # Date to Transaction AM or PM ... just like that. one or the other.
    end

    def _event_zip_OP
      :delete_line
    end

    def _event_zip
      '17111'
      # TODO
      # zip code of the transaction... for now we probably want to use the default zip but ultimately we want to use the GPS of the omm
    end

    def _event_location_OP
      :delete_line
    end

    def _event_location
      'Harrisburg'
      # TODO
      # location of the transaction... takes any short string.  We probably want to use the default city.
    end

    def _event_state_OP
      :delete_line
    end

    def _event_state
      'PA'
      # TODO
      # state of the transaction
    end

    def _store_number_OP
      :delete_line
    end

    def _store_number
      :delete_line
      # TODO
      # store number
    end

    def _order_num_OP
      :delete_line
    end

    def _order_num
      :delete_line
      # TODO
      # order number
    end

    def _member_num_OP
      :delete_line
    end

    def _member_num
      :delete_line
      # TODO
      # member number
    end

    def _flight_num_OP
      :delete_line
    end

    def _flight_num
      :delete_line
      # TODO
      # airlines only.  the flight number if we ever take this info.
    end

    def _product_name_OP
      :delete_line
    end

    def _product_name
      :delete_line
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
