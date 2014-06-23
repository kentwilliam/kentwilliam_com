$ ->
  $ '.articles-edit textarea'
    .on 'input', _.debounce (event) ->
      $.ajax
        type: 'GET'
        url: location.href.replace '/edit', '/preview'
        data: content: $(event.target).val()
      .done (result) ->
        $('.preview').html(result)
    , 500

  $ '.articles-edit form'
    .on 'submit', (event) ->
      $.ajax
        type: 'PUT'
        url: location.href.replace '/edit', ''
        data: $(this).serialize()
      .done (result) ->
        console.log '----', result
      false
