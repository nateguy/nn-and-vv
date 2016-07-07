$page = $('#page-home-events')

return if $page.length is 0

initialize = ->
  $event_map = $('#event_map')
  initial_lat = $(".nav-tabs li.active a").data('lat')
  initial_lng = $(".nav-tabs li.active a").data('lng')
  myLatLng = new google.maps.LatLng(initial_lng, initial_lat)
  mapProp = {
    center: myLatLng,
    zoom: 15,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
  }
  map = new google.maps.Map($event_map[0], mapProp)
  marker = new google.maps.Marker({
    position: myLatLng,
    map: map,
  })


  $('body').on 'click', '.nav-tabs a',->
    $this = $(this)
    lat = $this.data('lat')
    lng =  $this.data('lng')

    newLatLng = new google.maps.LatLng(lng,lat)
    marker.setPosition(newLatLng)
    map.panTo(newLatLng)


  # google.maps.event.trigger(event_map, 'resize')

google.maps.event.addDomListener(window, 'load', initialize())
