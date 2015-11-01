#= require_self
#= require_tree ./services
#= require_tree ./controllers/home
#= require_tree ./controllers/notes
#= require angular-rails-templates

Organizer = angular.module('Organizer', ['ngRoute', 'ngResource', 'ngAnimate', 'templates'])

Organizer.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.when('/notes', { templateUrl: '../assets/notesIndex.html', controller: 'NotesCtrl' } )

  $routeProvider.otherwise({ templateUrl: '../assets/homeIndex.html', controller: 'IndexCtrl' } )
])