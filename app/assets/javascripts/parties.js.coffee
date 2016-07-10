# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$body = $('body')

$body.on 'click', '.btn-add-guest', (e) ->
  $form = $(this).closest('form')
  $element = $(document.createElement('li')).addClass('guest-item')

  $element_last_name_input = $(document.createElement('input'))
  $element_last_name_input.attr("type", "text")
  $element_last_name_input.attr("name", "party[last_names][]")
  $element_last_name_input.attr("id", "party_last_names")
  $element_last_name_input.attr("placeholder", "Last Name")
  $element_last_name_input.attr("multiple", true)

  $element_first_name_input = $(document.createElement('input'))
  $element_first_name_input.attr("type", "text")
  $element_first_name_input.attr("name", "party[first_names][]")
  $element_first_name_input.attr("id", "party_first_names")
  $element_first_name_input.attr("placeholder", "First Name")
  $element_first_name_input.attr("multiple", true)

  $element_close = "Remove/消除"
  $element_close_btn = $(document.createElement('a')).addClass('btn-remove-guest').text($element_close)
  $element.append($element_first_name_input)
  $element.append($element_last_name_input)
  $element.append($element_close_btn)
  $form.find(".guest_list").append($element)
  e.preventDefault()
$body.on 'click', '.btn-remove-guest', (e) ->
  $(this).closest(".guest-item").remove()
