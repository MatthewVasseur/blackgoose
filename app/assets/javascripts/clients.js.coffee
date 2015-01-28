# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('html').keydown (e) ->
    if (e.which == 40)
      # console.log('down')
      pageDown()
    else if (e.which == 38)
      # console.log('up')
      pageUp()
    return

pageUp = ->
  if (page == "escorts")
    jQuery ->
      $("#clients .container.buttons").removeClass("fadeOutUp")
      $("#clients .container.buttons").addClass("fadeInDown")
      $("#clients #escorts").removeClass("fadeInUpBig")
      $("#clients #escorts").addClass("fadeOutDown")
      page = "buttons"

pageDown = ->
  if (page == "buttons")
    jQuery ->
      $("#clients .container.buttons").addClass("fadeOutUp")
      $("#clients .container.buttons").removeClass("fadeInDown")
      $("#clients #escorts").removeClass("fadeOutDown")
      $("#clients #escorts").addClass("animated fadeInUpBig");
      page = "escorts"
