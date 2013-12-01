# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#new_image').fileupload
    dataType: 'json'
    add: (e, data) ->
      file = data.files[0]
      data.context = $(tmpl("template-upload", file))
      $('#uploads_table #placeholder').remove()
      $('#uploads_table tbody').prepend(data.context)
      data.submit()      
    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.bar').css('width', progress + '%')
    done: (e, data) ->
      $('.preview', data.context).html($('<img />').attr('src', data.result.thumbnail))
      $('.link', data.context).html($('<a>').attr('href', data.result.link).append('show'))
  