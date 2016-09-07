angular.module('Organizer').controller('NotesCtrl', ['$scope', 'Note', 'Navbar', ($scope, Note, Navbar) ->
  Navbar.switchTo('#notes-link')

  $scope.notes =
    note: { content: 'Please wait'}

  loadNotes = ->
    $scope.notes = Note.getAll()

  loadNotes()

  $scope.deleteNote = (note) ->
    Note.destroy(note)
    $scope.notes.splice($scope.notes.indexOf(note), 1)

  $scope.cancelEdit = (note) ->
    note.content = sessionStorage.lastEditedNote
    note.editing = false

  $scope.saveNote = (note) ->
    Note.saveNote(note)

  $scope.addNewNote = ->
    newNote = Note.initNewNote()
    $scope.notes.unshift(newNote)
])