$(document).on "turbolinks:load", ->
  ($ '[data-ga-event-category]').on 'click', ->
    ga 'send',
      hitType: 'event',
      eventCategory: ($ this).data('ga-event-category'),
      eventAction: ($ this).data('ga-event-action'),
      eventLabel: ($ this).data('ga-event-label')