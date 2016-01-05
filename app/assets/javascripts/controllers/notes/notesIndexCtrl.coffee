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
      setTimeout (->
        element.find('textarea').height(element.find('textarea')[0].scrollHeight)
      ), 10
      element.find('textarea').focusout ->
        setTimeout (->
          Note.saveNote(scope.note)
        ), 2000 #Wait 2 sec, let user use buttons

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