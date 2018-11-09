class App.Banks
  @show: ->
    ($ '#banks-filter input').on 'change', ->
      App.Filter.exec('#banks-filter')
      
    ($ 'a[data-order]').on 'click', ->
      App.Order.exec('#banks-filter', ($ this).data('order'))
    
$(document).on "turbolinks:load", ->
  App.Banks.show() if $('.banks.show').length > 0