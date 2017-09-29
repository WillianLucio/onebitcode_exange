$(document).ready ->
  $("#quantity").keyup ->
    exchange()

  $('#currency').click ->
    exchange()

  $('#currency_destination').click ->
    exchange()

  $('#reverse_currencies').click ->
    if $('form').attr('action') == '/exchange'
      currency = $('#currency').val()
      currency_destination = $('#currency_destination').val()

      $('#currency').val(currency_destination)
      $('#currency_destination').val(currency)

      exchange()

  $('form').submit ->
    if $('form').attr('action') == '/exchange'
      exchange()

  exchange = () ->
    $.ajax '/exchange',
        type: 'POST'
        dataType: 'json'
        data: {
                currency: $("#currency").val(),
                currency_destination: $("#currency_destination").val(),
                quantity: $("#quantity").val()
              }
        error: (jqXHR, textStatus, errorThrown) ->
          alert textStatus
        success: (data, text, jqXHR) ->
          $('#result').val(data.value)
      return false;
