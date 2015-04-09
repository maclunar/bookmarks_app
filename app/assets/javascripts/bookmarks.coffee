init_form = ->
  forms = 'form.new_bookmark[data-remote="true"], form.edit_bookmark[data-remote="true"]'

  # $('body').on forms, "ajax:error", (e, r, s) ->
  #   $('#bookmark_form_wrapper').replaceWith(r.responseText)

  $(forms).on "ajax:error", (e, r, s) ->
    $('#bookmark_form_wrapper').replaceWith(r.responseText)

  $(forms).on "ajax:success", (e) ->
    Turbolinks.visit $(this).data('success-redirect')

@Bookmarks = { init_form }
