#= require_self
#= require_tree ./controllers/home
#= require_tree ./controllers/notes

Organizer = angular.module('Organizer', ['ngRoute'])

Organizer.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.when('/notes', { templateUrl: '../assets/notesIndex.haml', controller: 'NotesCtrl' } )

  $routeProvider.otherwise({ templateUrl: '../assets/homeIndex.haml', controller: 'IndexCtrl' } )
])