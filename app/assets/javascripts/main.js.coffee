#= require_self
#= require_tree ./templates
#= require_tree ./services
#= require_tree ./controllers/home
#= require_tree ./controllers/notes

Organizer = angular.module('Organizer', ['ngRoute', 'ngResource', 'ngAnimate', 'templates'])

Organizer.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.when('/notes', { templateUrl: 'notesIndex.html', controller: 'NotesCtrl' } )

  $routeProvider.otherwise({ templateUrl: 'homeIndex.html', controller: 'IndexCtrl' } )
])

Organizer.directive('navLink', [ ->
  return {
    restrict: 'AEC',
    link: (scope, element, attrs) ->
      element.on 'click', ->
        $('.nav-link').each ->
          $(this).removeClass('active')

        if element.hasClass('navbar-brand')
          $('.nav-link.home').addClass('active')
        else
          element.addClass('active')
      return true
  }
])