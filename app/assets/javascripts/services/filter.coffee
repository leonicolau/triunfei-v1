class App.Filter
  @exec: (filter_id) ->
    url = $(filter_id).attr('action')
    
    fields = ($ "#{filter_id} .desktop-filter input:checked:visible") if $('.desktop-filter').is(':visible')
    fields = $("#{filter_id} .mobile-filter input:checked") unless fields
    
    fields.each ->
      unless ($ this).data('search-param') == undefined
        slug = ($ this).data('search-param')
        url += "/#{slug}"
      
    Turbolinks.visit(url + location.search)