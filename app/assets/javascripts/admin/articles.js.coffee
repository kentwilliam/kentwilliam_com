$ ->
  updatePreview = ->
    $.ajax
      type: 'GET'
      url: location.href.replace '/edit', '/preview'
      data: markdown: $('.articles-edit textarea').val()
    .done (result) ->
      $('.preview').html(result)

  save = (event) ->
    $.ajax
      type: 'PUT'
      url: location.href.replace '/edit', ''
      data: $(this).serialize()
    .done (result) ->
      console.log '----', result
    false

  $ '.articles-edit textarea'
    .on 'input', _.debounce updatePreview, 500

  $ '.articles-edit form'
    .on 'submit', save

  updatePreview()
