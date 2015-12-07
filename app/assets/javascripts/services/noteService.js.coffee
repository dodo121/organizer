Organizer = angular.module('Organizer')

Organizer.factory('Note', ['$resource', ($resource) ->
  Note = $resource('/notes/:noteId', { noteId: '@id', format: 'json' },
    {
      'save': { method: 'PUT' },
      'create': { method: 'POST' }
    }
  )

  factory = {}

  factory.getAll = ->
    Note.query()

  factory.destroy = (note) ->
    note.$delete()

  factory.saveNote = (note) ->
    if note.id == undefined then note.$create() else note.$save()

  return factory
])