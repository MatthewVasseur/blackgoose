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
  if (gon.page == "escorts")
    jQuery ->
      $("#clients #buttons").removeClass("fadeOutUp hideMe")
      $("#clients #buttons").addClass("fadeInDown")
      $("#clients #escorts").removeClass("fadeInUpBig")
      $("#clients #escorts").addClass("fadeOutDown hideMe")
      gon.page = "buttons"

pageDown = ->
  if (gon.page == "buttons")
    jQuery ->
      $("#clients #buttons").addClass("fadeOutUp hideMe")
      $("#clients #buttons").removeClass("fadeInDown")
      $("#clients #escorts").removeClass("fadeOutDown hideMe")
      $("#clients #escorts").addClass("fadeInUpBig");
      gon.page = "escorts"
