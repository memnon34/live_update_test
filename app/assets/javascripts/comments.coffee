# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.client = new Faye.Client('/faye')
try
 client.unsubscribe '/comments'
catch
 console?.log "Can't unsubscribe." # print a message only if console is defined

jQuery ->
  client.subscribe '/comments', (payload) ->
    $('#comments').find('.media-list').prepend(payload.message) if payload.message

  $('#new_comment').submit -> $(this).find("input[type='submit']").val('Sending...').prop('disabled', true)
