class App.Order
  @exec: (filter_id, value) ->
    # it needs to work with filter URL
    filter_url = $(filter_id).attr('action')
    
    # if it's not at filter
    if location.href.indexOf(filter_url) == -1
      url = filter_url
    else
      url = location.origin + location.pathname
    
    params = location.search
        
    url = "#{url}/#{value}#{params}"
      
    Turbolinks.visit(url)