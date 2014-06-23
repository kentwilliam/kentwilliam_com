$ ->
  $ '.articles-edit textarea'
    .on 'input', _.debounce (event) ->
      $.ajax
        type: 'GET'
        url: url()
        data: content: $(event.target).val()
      .done (result) ->
        $('.preview').html(result)
    , 500

  url = ->
    window.location.href.replace('/edit', '') + '/preview'
