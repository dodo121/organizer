Organizer = angular.module('Organizer')

Organizer.factory('Note', ['$resource', ($resource) ->
  Note = $resource('/notes/:noteId.json', { noteId: '@id' }, {})

  factory = {}

  factory.getAll = ->
    console.log('in get all')
    Note.query()

  factory.destroy = (note) ->
    console.log('in delete')
    note.$delete()


  return factory
])