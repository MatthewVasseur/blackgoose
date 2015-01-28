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
    $("#clients #buttons").removeClass("fadeOutUp hideMe")
    $("#clients #buttons").addClass("fadeInDown")
    $("#clients #escorts").removeClass("fadeInUpBig")
    $("#clients #escorts").addClass("fadeOutDown hideMe")
    gon.page = "buttons"

  else if (gon.page == "appointment")
    $("#clients #escorts").addClass("fadeInDownBig");
    $("#clients #escorts").removeClass("fadeOutUp hideMe");
    $("#clients #appointment").addClass("fadeOutDown hideMe")
    $("#clients #appointment").removeClass("fadeInUp")
    gon.page = "escorts"

pageDown = ->
  if (gon.page == "buttons")
    $("#clients #buttons").addClass("fadeOutUp hideMe")
    $("#clients #buttons").removeClass("fadeInDown")
    $("#clients #escorts").removeClass("fadeOutDown hideMe")
    $("#clients #escorts").addClass("fadeInUpBig");
    gon.page = "escorts"

  else if (gon.page == "escorts")
    $("#clients #escorts").addClass("fadeOutUp hideMe");
    $("#clients #escorts").removeClass("fadeInUpBig");
    $("#clients #appointment").removeClass("fadeOutDown hideMe")
    $("#clients #appointment").addClass("fadeInUp");
    gon.page = "appointment"

