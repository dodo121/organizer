Organizer = angular.module('Organizer')

Organizer.controller('NotesCtrl', ['$scope', '$location', '$resource', 'Note', ($scope, $location, $resource, Note) ->
  $scope.notes =
    note: { content: 'Please wait'}

  loadNotes = ->
    $scope.notes = Note.getAll()

  loadNotes()

  $scope.deleteNote = (note) ->
    Note.destroy(note)
    $scope.notes.splice($scope.notes.indexOf(note), 1)

  $scope.editing = false

  $scope.editNote = ->
    $scope.editing = true

  $scope.showForm
])