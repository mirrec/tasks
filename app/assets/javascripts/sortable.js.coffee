$(document).on 'ready page:load ajaxComplete', ->
  $('[data-sortable="tasks"]').sortable
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
    connectWith: 'ul.uncompleted'

  $('[data-sortable="projects"]').sortable
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
