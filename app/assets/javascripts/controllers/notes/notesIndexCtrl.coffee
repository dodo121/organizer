Organizer = angular.module('Organizer')

Organizer.controller('NotesCtrl', ['$scope', '$location', '$resource', 'Note', 'Navbar', ($scope, $location, $resource, Note, Navbar) ->
  Navbar.setActive('#notes')

  $scope.notes =
    note: { content: 'Please wait'}

  loadNotes = ->
    $scope.notes = Note.getAll()

  loadNotes()

  $scope.deleteNote = (note) ->
    Note.destroy(note)
    $scope.notes.splice($scope.notes.indexOf(note), 1)
])

Organizer.directive('myNote', ['Note', (Note) ->
  return {
    restict: 'A',
    link: (scope, element, attrs) ->
      element.on 'click', ->
        scope.note.editing = true
        setTimeout (->
          $('#note_' + scope.note.id).find('.edit-note').focus()
        ), 5

      element.find('.edit-note').focusout ->
        Note.updateNote(scope.note)

      return true
  }
])

