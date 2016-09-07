angular.module('Organizer').factory('Navbar', ->
  factory = {}

  factory.switchTo = (cssClass) ->
    factory.cleanup = ->
      $('.nav-link').each ->
        $(this).removeClass('active')

    el = $('.navbar-nav').find(cssClass)

    factory.cleanup()

    if el.hasClass('navbar-brand')
      $('.nav-link.home').addClass('active')
    else
      el.addClass('active')

  return factory
)