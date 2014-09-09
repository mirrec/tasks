$(document).on 'ready page:load ajaxComplete', ->
  $('[data-sortable="true"]').sortable
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
    connectWith: 'ul.uncompleted'

