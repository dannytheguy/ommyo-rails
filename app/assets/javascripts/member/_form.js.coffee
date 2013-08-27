$ ->
  if $('textarea#message_text').length > 0
    $('textarea#message_text').autogrow()

    $.get '/brands.json', (brands) ->
      $('textarea#message_text').bind 'change keyup input', () ->
        message_text = this.value.toLowerCase()

        matches = []

        for brand in brands
          matches.push brand if brand.keywords.some (keyword) ->
            message_text.indexOf(keyword.toLowerCase()) >= 0

        $('input.omm_brand_id').remove()
        logos = $('<div />').attr(id: 'ommyo-member-form-logos')

        for brand in matches
          $('<input />').attr(class: 'omm_brand_id', type: 'hidden', name: 'omm[brand_id][]', multiple: 'multiple', value: brand.id).insertBefore($('input#ommyo-member-form-send'))
          logos.append($('<img />').attr('src', brand.logo))

         $('div#ommyo-member-form-logos').html logos.html() unless $('div#ommyo-member-form-logos').html() == logos.html()

         if matches.length > 0
           $('input#ommyo-member-form-send').removeAttr('disabled')
         else if $('input#ommyo-member-form-send').attr('disabled') != 'disabled'
           $('input#ommyo-member-form-send').attr('disabled', 'disabled')

      $('textarea#message_text').trigger 'change'
