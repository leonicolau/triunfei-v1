class App.Investments
  @index: ->
    ($ '#investments-filter input').not('.amount, .time_value').on 'change', ->
      App.Filter.exec('#investments-filter')

    ($ 'a[data-order]').on 'change', ->
      App.Order.exec('#investments-filter', ($ this).data('order'))

    ($ '.amount, .time_value').on ('change'), ->
      App.Investments.calculateQuota()

  @calculateQuota: ->
    url = location.pathname + '?amount=' + $('.amount:visible').val()
    url += '&time_value=' + $('.time_value:visible').val()

    Turbolinks.visit(url)

$(document).on "turbolinks:load", ->
  App.Investments.index() if $('.investments.index').length > 0
