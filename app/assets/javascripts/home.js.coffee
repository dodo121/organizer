#= require_self
#= require_tree ./controllers/home

Organizer = angular.module('Organizer', [])

Organizer.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.when('/notes', { templateUrl: '../assets/indexNotes.html', controller: 'NotesCrtl' } )

  $routeProvider.otherwise({ templateUrl: '../assets/mainIndex.html', controller: 'IndexCtrl' } )
])