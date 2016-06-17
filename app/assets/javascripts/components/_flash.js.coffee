$body = $('body')

$(".alert").fadeTo(2000, 500).slideUp(500, ->
  $(".alert").alert('close')
)

$body.on 'click', ".alert",->
  $(this).alert('close')
