window.App ||= {}
window.App.Modal ||= {}

# @param [jQueryObject, HTML] container_or_content The container or content to be displayed
# @param [Object] options Options to use
#   customContent: If true, no wrapper like `.modal-header` and `.modal-body` will be added
#                  This is set to true when container_or_content has only one top node and
#                  has `.modal-header` and `.modal-body` already
window.App.Modal.showModalWithContent = (container_or_content, options = {}) ->
  opts = $.extend({}, {customContent: false, class: ''}, options)

  $modal = $('<div></div>').addClass('modal fade')


  $container_or_content = $(container_or_content)
  if $container_or_content.length is 1
    # Is container
    $container = $container_or_content
    $content = $($container.html())
  else
    # Is content
    $container = $() # Empty
    $content = $container_or_content


  if $container.children('.modal-header').length > 0 and $container.children('.modal-body').length > 0
    opts.customContent = true

  # Always add container classes
  containerClasses = $container.attr('class')
  if containerClasses?
    opts.class = [opts.class, containerClasses].join(' ')
  # Always add container data
  $modal.data($container.data())

  if opts.customContent
    $modal.html($content)
  else
    console.log "header"
    $modalHead = $('<div></div>').addClass('modal-header clearfix')
    .append(
        $('<button></button>')
        .addClass('close')
        .attr('data-dismiss', 'modal')
        .text('X')
      )

    $modalBody = $('<div></div>')
    .addClass('modal-body')
    .html($content)


    $modal.html($modalDialog).html($modalHead).append($modalBody)


  extraClasses = opts.class
  if extraClasses? && extraClasses.length > 0
    $modal.addClass(extraClasses)

  $modal
  .modal()
