# public

init = ->
  $("#ajax-modal").modal('hide')
  add_event_handlers()

# private

add_event_handlers = ->
  $('a[data-target="#ajax-modal"]').click (e) ->
    reset_modal()
    $modal = $('#ajax-modal')
    $.get $(this).attr('href'), (data) ->
      $modal.find('.modal-body').html(data)
    $modal.modal('show')
    false

reset_modal = ->
  $("#ajax-modal .modal-body").html('loading...')


@Modals = { init }
