# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
    Prism.highlightAll()


$(document).on('click', '.ajax-form', ( ->
  data = user:
    "email": 'a@maildrop.cc'
    "password": 'password'
    "remember_me": 1
  getData "/users/sign_in", data
));

getData = (url, data) ->
  console.log(data)
  $.ajax
    url:        url
    type:       "POST"
    data:       data
    dataType:   "json",
    encoding:   'UTF-8'
    beforeSend: ajaxStart
    success:    ajaxSuccess
    error:      ajaxError
    complete:   ajaxComplete
    xhrFields:  withCredentials: true
  return

ajaxStart = (xhrInstance) ->
  #A. Clear Any Previously Written HTML
  #B. Show Preloader
  csrf_token = $('meta[name="csrf-token"]').attr('content')
  xhrInstance.setRequestHeader('X-CSRF-Token', csrf_token);
  console.log 'ajaxStart:', csrf_token
  return

ajaxError = (xhrInstance, message, optional) ->
  console.log 'ajaxError:', message, optional
  return

ajaxComplete = (xhrInstance, status) ->
  #A. Remove any preloaders
  console.log 'ajaxComplete:'
  return

ajaxSuccess = (data, status) ->
  #Write your Parse XML Function
  parseData data
  return

parseData = (data) ->
  #console.log 'parseData:', data
  $('.ajax-response code').text JSON.stringify(data, null, '\t')
  return
