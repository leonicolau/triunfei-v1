class App.Accounts
  @index: ->
    ($ '#accounts-filter input').on 'change', ->
      App.Filter.exec('#accounts-filter')

    ($ 'a[data-order]').on 'click', ->
      App.Order.exec('#accounts-filter', ($ this).data('order'))
    
$(document).on "turbolinks:load", ->
  App.Accounts.index() if $('.accounts.index').length > 0