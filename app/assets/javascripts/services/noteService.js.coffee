Organizer = angular.module('Organizer')

Organizer.factory('Note', ['$resource', ($resource) ->
  Note = $resource('/notes/:noteId', { noteId: '@id', format: 'json' }, {})

  factory = {}

  factory.getAll = ->
    Note.query()

  factory.destroy = (note) ->
    note.$delete()

  factory.updateNote = (note) ->
    #FIXME note.$save()

  return factory
])