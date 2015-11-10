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

  factory.updateNote = (note) ->
    console.log 'in update note'
    note.$save()

  return factory
])