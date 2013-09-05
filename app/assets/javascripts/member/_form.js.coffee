$ ->
  if $('textarea#message_text').length > 0
    $('textarea#message_text').autogrow()

    if $('div#ommyo-member-form-logos').length > 0
      $.get '/brands.json', (brands) ->
        $('textarea#message_text').bind 'change keyup input', () ->
          message_text = this.value.toLowerCase()

          matches = []

          for brand in brands
            matches.push brand if brand.keywords.some (keyword) ->
              message_text.indexOf(keyword.toLowerCase()) >= 0

          previous = $('input.omm_brand_id').val()
          $('input.omm_brand_id').remove()

          logos = $('<div />').attr(id: 'ommyo-member-form-logos')
          for brand in matches
            logos.append($('<img />').attr(src: brand.logo, brand: brand.id, class: 'ommyo-member-form-logo'))
          unless $('div#ommyo-member-form-logos').html() == logos.html()
            $('div#ommyo-member-form-logos').html logos.html()

            $('div#ommyo-member-form-logos img').each () ->
              $(this).bind 'click', () ->
                $('div#ommyo-member-form-logos img').removeClass('ommyo-member-form-logo-active')
                $('input.omm_brand_id').remove()

                $(this).addClass('ommyo-member-form-logo-active')
                $('<input />').attr(class: 'omm_brand_id', type: 'hidden', name: 'omm[brand_id][]', multiple: 'multiple', value:
                                    $(this).attr('brand')).insertBefore($('input#ommyo-member-form-send'))

              previous = $(this) if $(this).attr('brand') == previous

          if matches.length > 0
            $('input#ommyo-member-form-send').removeAttr('disabled')
            $('#ommyo-member-form-brandsuggest').css('display', 'none')
            if previous
              $(previous).trigger 'click'
            else
              $('div#ommyo-member-form-logos img:first').trigger 'click'
          else
            if $('input#ommyo-member-form-send').attr('disabled') != 'disabled'
              $('input#ommyo-member-form-send').attr('disabled', 'disabled')
            if message_text.length > 20
              $('#ommyo-member-form-brandsuggest').css('display', 'block')
            else
              $('#ommyo-member-form-brandsuggest').css('display', 'none')

        $('textarea#message_text').trigger 'change'
