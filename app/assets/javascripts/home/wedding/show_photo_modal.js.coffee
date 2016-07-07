#= require jquery

$('body').on(
  'click'
  '.js-load-image'
  (e) ->
    $this = $(this)
    # window.App.Authentication.Action.showSignUpModal()
    load_gallery_url = $this.attr('href')
    $.ajax(
      url: load_gallery_url
      type: "GET"
      dataType: "html"
      data:
        image_path: $this.data('image-path'),
    ).done (data) ->
      window.App.Modal.showModalWithContent(data, {customContent: true})

    e.stopPropagation()
    e.preventDefault()
)
