$ ->
  updatePreview = ->
    form = $('form')[0];

    $.ajax
      type: 'POST'
      url: location.href.replace '/edit', '/preview'
      data: $(this).serialize()
      markdown: $(form).serialize()
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

  $ 'input, textarea'
    .on 'input', _.debounce updatePreview, 150

  $ '.articles-edit form'
    .on 'submit', save

  updatePreview()
