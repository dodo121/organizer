Organizer = angular.module('Organizer')

Organizer.factory 'Navbar', ->
  factory = {}

  factory.setActive = (string) ->
    console.log string

  return factory
