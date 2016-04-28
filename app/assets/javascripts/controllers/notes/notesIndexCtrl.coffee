Organizer = angular.module('Organizer')

Organizer.controller('NotesCtrl', ['$scope', 'Note', 'Navbar', ($scope, Note, Navbar) ->
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

  $scope.saveNote = (note) ->
    Note.saveNote(note)

  $scope.addNewNote = ->
    newNote = Note.initNewNote()
    $scope.notes.unshift(newNote)
])

Organizer.directive('myNote', ['Note', (Note) ->
  return {
    restict: 'A',
    link: (scope, element, attrs) ->
      setTimeout (->
        element.find('textarea').height(element.find('textarea')[0].scrollHeight)
      ), 1

      element.click ->
        $('.buttons').not(element.find('.buttons')).slideUp()
        element.find('.buttons').slideDown()
        scope.note.editing = true
        sessionStorage.lastEditedNote = scope.note.content

      element.find('textarea').focusout ->
        setTimeout (->
          if scope.note.content != sessionStorage.lastEditedNote #Send update only if note content has changed
            Note.saveNote(scope.note)
        ), 2000 #Wait 2 sec, let user use buttons
      return true
  }
])