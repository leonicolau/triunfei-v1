class App.Loans
  @index: ->
    ($ '#loans-filter input').not('.amount, .time_value, .time_type, .time_type_mobile').on 'change', ->
      App.Filter.exec('#loans-filter')

    ($ '.amount, .time_value').on 'blur', ->
      App.Loans.calculateQuota()

    ($ '.time_type, .time_type_mobile').on 'change', ->
      App.Loans.calculateQuota()

  @calculateQuota: ->
    url = location.pathname + '?amount=' + $('.amount:visible').val()
    url += '&time_value=' + $('.time_value:visible').val()
    url += '&time_type=' + $('.time_type:visible:checked').val()

    Turbolinks.visit(url)

$(document).on "turbolinks:load", ->
  App.Loans.index() if $('.loans.index').length > 0
