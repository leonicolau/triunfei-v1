class App.Cards
  @index: ->
    ($ '#cards-filter input').on 'change', ->
      App.Filter.exec('#cards-filter')
    
    ($ 'a[data-order]').on 'click', ->
      App.Order.exec('#cards-filter', ($ this).data('order'))
    
$(document).on "turbolinks:load", ->
  App.Cards.index() if $('.cards.index').length > 0