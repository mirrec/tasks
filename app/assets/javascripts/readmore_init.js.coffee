$(document).on 'ready page:load ajaxComplete', ->
  $('.description').readmore({
    maxHeight: 100
  })
