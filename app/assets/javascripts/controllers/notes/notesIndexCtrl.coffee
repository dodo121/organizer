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
    note.editing = false

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

      scope.$watch ((scope) ->
        scope.note.validationStatus
      ), (newValue, oldValue) ->
        if newValue != oldValue
          objectIsValid = newValue
          if objectIsValid
            alert 'valid'
          else
            alert 'invalid'
            #TODO apply nice flash messages

      element.click ->
        $('.buttons').not(element.find('.buttons')).slideUp()
        note.editing = false for note in scope.notes when note isnt scope.note

        element.find('.buttons').slideDown()
        sessionStorage.lastEditedNote = scope.note.content # save value before user starts to edit
        element.find('textarea').on 'input', ->
          scope.note.editing = true

          element.find('textarea').focusout ->
            setTimeout (->
              if scope.note.content != sessionStorage.lastEditedNote #Send update only if note content has changed
                Note.saveNote(scope.note)
            ), 1000 #Wait 1 sec, let user use buttons


      return true
  }
])