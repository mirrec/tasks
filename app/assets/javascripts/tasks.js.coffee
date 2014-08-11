$(document).on 'ready page:load', ->
  $('form.edit_task input[type="checkbox"]').on 'change', ->
    $(this).parent('form').submit()

