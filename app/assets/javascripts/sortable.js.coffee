$(document).on 'ready page:load', ->
  $('[data-sortable="true"]').sortable
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))

