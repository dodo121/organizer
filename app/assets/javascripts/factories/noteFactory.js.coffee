angular.module('Organizer').factory('Note', ['$resource', ($resource) ->
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
    note.$delete() if note.id

  factory.saveNote = (note) ->
    if note.id == undefined
      saveAction = note.$create()
    else
      saveAction = note.$save()

    saveAction.then ((res) ->
      note.validationStatus = true
    ), (res) -> note.validationStatus = false

    note

  factory.initNewNote = ->
    new Note({ content: '' })

  return factory
])