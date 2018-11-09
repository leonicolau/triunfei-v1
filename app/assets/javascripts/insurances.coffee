class App.Insurances
  @index: ->
    ($ '#insurances-filter input').on 'change', ->
      App.Filter.exec('#insurances-filter')
    
    ($ 'a[data-order]').on 'click', ->
      App.Order.exec('#insurances-filter', ($ this).data('order'))
    
$(document).on "turbolinks:load", ->
  App.Insurances.index() if $('.insurances.index').length > 0