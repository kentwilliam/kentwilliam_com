$ ->
  # External navigation
  mixpanel.track_links 'a', 'External link click', (node) ->
    # Provide context for clicks in articles even from home page
    'Referrer Context URI': $(node).closest('article').attr('data-uri')

  # Internal navigation
  mixpanel.track 'Page view', { href: window.location.href, path: window.location.pathname }
