Organizer = angular.module('Organizer')

Organizer.controller('NotesCtrl', ['$scope', '$http', ($scope, $http) ->
  $scope.notes =
    note: { content: 'Please wait'}

  loadNotes = ->
    $http(
      method: 'GET'
      url: '/notes.json').then ((response) ->
        $scope.notes =  response.data
        return
      ), (response) ->
        $scope.notes = note { content: 'Epic fail!' }
        return

  loadNotes()
])