$('body').on(
  'click'
  '.js-load-reservation'
  (e) ->
    console.log "loading.."
    # window.App.Authentication.Action.showSignUpModal()
    load_party_url = $('.js-load-reservation').attr('href')
    $.ajax(
      url: load_party_url
      type: "GET"
      dataType: "html"
    ).done (data) ->
      window.App.Modal.showModalWithContent(data, {customContent: true})

    e.stopPropagation()
    e.preventDefault()
)
