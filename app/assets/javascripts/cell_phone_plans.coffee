class App.CellPhonePlans
  @index: ->
    ($ '#cell_phone_plans-filter input').on 'change', ->
      App.Filter.exec('#cell_phone_plans-filter')
    
    ($ 'a[data-order]').on 'click', ->
      App.Order.exec('#cell_phone_plans-filter', ($ this).data('order'))
    
$(document).on "turbolinks:load", ->
  App.CellPhonePlans.index() if $('.cell_phone_plans.index').length > 0