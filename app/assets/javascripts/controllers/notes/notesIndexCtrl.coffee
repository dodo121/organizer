Organizer = angular.module('Organizer')

Organizer.controller('NotesCtrl', ['$scope', ($scope) ->
  $scope.notes =
    note: { content: 'Lorem ipsum dolor sit ament sup.'}
    note2: { content: 'Lorem dolor sit ament sup. ipsum'}
])