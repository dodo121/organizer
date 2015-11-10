Organizer = angular.module('Organizer')

Organizer.controller('NotesCtrl', ['$scope', '$location', '$resource', 'Note', ($scope, $location, $resource, Note) ->
  $scope.notes =
    note: { content: 'Please wait'}

  loadNotes = ->
    $scope.notes = Note.getAll()

  loadNotes()

  $scope.deleteNote = (note) ->
    #$('#note_' + note.id).find('.note-content').css('visibility', 'hidden')
    Note.destroy(note)
    $scope.notes.splice($scope.notes.indexOf(note), 1)

  $scope.editNote = (note) ->
    note.editing = true
    setTimeout (->
      $('#note_' + note.id).find('.edit-note').focus()
      $('#note_' + note.id).find('.edit-note').focusout ->
        console.log 'focus out'
        Note.updateNote(note)
    ), 5

    return true

 # $scope.showForm
])