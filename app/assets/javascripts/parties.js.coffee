# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require i18n

$body = $('body')

$body.on 'click', '.btn-add-guest', (e) ->
  guest_index =  $(".guest-item").length + 1
  $form = $(this).closest('form')
  $element = $(document.createElement('li')).addClass('guest-item')

  $element_last_name_input = $(document.createElement('input')).addClass("string")
  $element_last_name_input.attr("type", "string")
  $element_last_name_input.attr("name", "party[last_names][]")
  $element_last_name_input.attr("id", "party_last_names")
  $element_last_name_input.attr("placeholder", "#{I18n.t('views.templates.party.placeholder.last_name')}")
  $element_last_name_input.attr("multiple", true)

  $element_first_name_input = $(document.createElement('input')).addClass("string")
  $element_first_name_input.attr("type", "string")
  $element_first_name_input.attr("name", "party[first_names][]")
  $element_first_name_input.attr("id", "party_first_names")
  $element_first_name_input.attr("placeholder", "#{I18n.t('views.templates.party.placeholder.first_name')}")
  $element_first_name_input.attr("multiple", true)

  $element_vegetarian_select = $(document.createElement('select')).attr("id", "party_vegetarians")
  $element_vegetarian_select.attr("name", "party[vegetarians][]")

  for key, item of ['true', 'false']
    label = I18n.t("views.templates.party.form.vegetarian.#{item}")
    $element_vegetarian_select_option = $(document.createElement('option'))
    $element_vegetarian_select_option.val(item).text(label)
    $element_vegetarian_select.append($element_vegetarian_select_option)

  $element_vegetarian_select.val('false')

  $remove_label = I18n.t("views.templates.party.form.remove_guest")

  $element_close_btn = $(document.createElement('a')).addClass('btn-remove-guest').text($remove_label)
  $element.append($element_first_name_input)
  $element.append($element_last_name_input)
  $element.append($element_vegetarian_select)
  $element.append($element_close_btn)
  $form.find(".guest_list").append($element)
  e.preventDefault()
  e.stopPropagation()

$body.on 'click', '.btn-remove-guest', (e) ->
  $(this).closest(".guest-item").remove()
