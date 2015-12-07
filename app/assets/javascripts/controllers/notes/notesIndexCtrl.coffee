Organizer = angular.module('Organizer')

Organizer.controller('NotesCtrl', ['$scope', '$location', '$resource', 'Note', 'Navbar', ($scope, $location, $resource, Note, Navbar) ->
  Navbar.switchTo('#notes-link')

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
        element.find('.note-content').hide()
        element.find('.edit-note').show().focus()

      element.find('.edit-note').focusout ->
        Note.saveNote(scope.note)

      return true
  }
])

Organizer.directive('addNewNote', [ '$compile', ($compile) ->
  return {
    restrict: 'E',
    link: (scope, element, attrs) ->
      element.on 'click', ->
        $('#notes').append($compile('<div ng-include="\'templates/notesNew.html\'"></div>')(scope))
      return true
  }
])